# Контроллер заявок (запросов) на аренду
class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  # POST /requests
  # POST /requests.json
  def create
    # rp - request parameters
    rp = req_params

    # сюда будем собирать ошибки при проверке заявки
    errors = {}

    model_name(rp, errors)
    aas_names(rp, errors)

    if errors.empty?
      export(rp) if PSOFT_DB
      mail(rp)
      render json: { message: format(I18n.t('request.status.ok'), id: rp.id || ' -') }
    else
      render status: :unprocessable_entity, json: errors
    end
  end

  private

  # Проводит фильтрацию полученных параметров и конвертацию строк с датами в тип Time
  def req_params
    rp = Hashie::Mash.new(params.permit(:begin_time, :end_time, :model, :last_name, :first_name, :patronymic,
                                        :birthdate, :email, :phone, :doc_number, :doc_issued_by, :doc_issued_date,
                                        :doc_registration, :lic_number, :lic_date, :lic_issued_by, :lic_valid_to,
                                        :license_category, :note, :price, additions: []))

    %i[begin_time end_time birthdate doc_issued_date lic_date lic_valid_to].each do |t|
      rp[t] = Time.iso8601(rp[t]) if rp[t]
    rescue ArgumentError # если параметр не является валидной датой, то вообще обнуляем его
      rp[t] = nil
    end

    # если в запросе вообще не было поля additions, то сделаем его пустым массивом
    rp.additions = [] unless rp.additions?
    rp.aas = []

    rp
  end

  # Заполняет имя модели авто по id
  def model_name(req, errors)
    m = Model.find(req.model)
    # TODO: это временное решение. Во-первых, код дублируется с модулем FormatableSerializer -
    # - надо делать виртуальный аттрибут в модели; во-вторых, слишком заморочено для простой
    # задачи - целая таблица под два темплейта, использование eval; в-третьих, отсутствие гибкости
    # (невозможно свободно задавать full_name для отдельной Model).
    m.formats.each do |fmt|
      req[fmt.key.to_sym] = (fmt.format % eval(fmt.args.gsub('$.', 'm.'))).strip
    end
  rescue ActiveRecord::RecordNotFound
    errors[:model] = I18n.t('errors.messages.invalid')
  end

  # Заполняет названия дополнений
  def aas_names(req, errors)
    req.additions.to_a.each do |a|
      req.aas << Addition.find(a).name
    rescue ActiveRecord::RecordNotFound
      errors[:additions] = I18n.t('errors.messages.invalid')
    end
  end

  # Создаёт заявку во внешней БД
  def export(req)
    rez = Rezerv.new(dt_b: req.begin_time, dt_e: req.end_time, model: req.full_name,
                     cli_lname: req.last_name, cli_name: req.first_name, cli_sname: req.patronymic,
                     cli_email: req.email, cli_phone: req.phone, cli_bdate: I18n.l(req.birthdate.to_date),
                     pasp_num: req.doc_number, pasp_vyd: req.doc_issued_by, pasp_street: req.doc_registration,
                     pasp_date: I18n.l(req.doc_issued_date.to_date),
                     vod_num: req.lic_number, vod_vyd: req.lic_issued_by, vod_date: I18n.l(req.lic_date.to_date))
    (1..8).each { |i| rez.send("dop#{i}=", req.aas[i]) }
    req.id = rez.id if rez.save
  end

  # Отправляет заявку по почте администратору и клиенту
  def mail(req)
    AdminMailer.with(parameters: req, source: request.host).request_email.deliver_now
    # TODO: анти-спам защита (например, отправлять только для зарегистрированных пользователей или капча)
    # TODO: сделать красивую HTML форму письма в фирменном стиле (сейчас text-only)
    CustMailer.with(parameters: req).request_email.deliver_now
  end
end
