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
    aas_names(rp)

    if NewGoogleRecaptcha.human?(req_params[:recaptcha_token]) && errors.empty? 
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
                                        :license_category, :note, :price, :recaptcha_token, additions: []))

    %i[begin_time end_time].each { |t| rp[t] = convert_param(rp[t], Time) }
    %i[birthdate doc_issued_date lic_date lic_valid_to].each { |t| rp[t] = convert_param(rp[t], Date) }

    # если в запросе вообще не было поля additions, то сделаем его пустым массивом
    rp.additions = [] unless rp.additions?

    rp
  end

  # конвертирует значение value в значение класса cls (Date, Time, DateTime) через метод iso8601
  def convert_param(value, cls)
    cls.iso8601(value)
  rescue ArgumentError # если параметр не является валидной датой, то вообще обнуляем его
    nil
  end

  # Заполняет имя модели авто по id
  def model_name(req, errors)
    req[:full_name] = Model.find(req.model).full_name
  rescue ActiveRecord::RecordNotFound
    errors[:model] = I18n.t('errors.messages.invalid')
  end

  # Заполняет названия дополнений
  def aas_names(req)
    req.aas = Addition.where(id: req.additions).pluck(:name)
  end

  # Создаёт заявку во внешней БД
  def export(req)
    rez = Rezerv.new(req2rez(req))
    (1..Rezerv::MAX_DOPS).each { |i| rez.send("dop#{i}=", req.aas[i]) }
    req.id = rez.id if rez.save
  end

  # создаёт хэш с параметрами модели Rezerv из параметров запроса request
  def req2rez(req)
    { dt_b: req.begin_time, dt_e: req.end_time, model: req.full_name,
      cli_lname: req.last_name, cli_name: req.first_name, cli_sname: req.patronymic,
      cli_email: req.email, cli_phone: req.phone, cli_bdate: req.birthdate && I18n.l(req.birthdate),
      pasp_num: req.doc_number, pasp_vyd: req.doc_issued_by, pasp_street: req.doc_registration,
      pasp_date: req.doc_issued_date && I18n.l(req.doc_issued_date),
      vod_num: req.lic_number, vod_vyd: req.lic_issued_by, vod_date: req.lic_date && I18n.l(req.lic_date) }
  end

  # Отправляет заявку по почте администратору и клиенту
  def mail(req)
    AdminMailer.with(parameters: req, source: request.host).request_email.deliver_now
    # TODO: анти-спам защита (например, отправлять только для зарегистрированных пользователей или капча)
    # TODO: сделать красивую HTML форму письма в фирменном стиле (сейчас text-only)
    CustMailer.with(parameters: req).request_email.deliver_now
  end
end
