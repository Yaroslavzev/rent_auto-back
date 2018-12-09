# Контроллер заявок (запросов) на аренду
class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  # POST /requests
  # POST /requests.json
  def create
    # rp - request parameters
    rp = req_params

    %i[begin_time end_time birthdate doc_issued_date lic_date lic_valid_to].each do |t|
      rp[t] = Time.iso8601(rp[t]) if rp[t]
    rescue ArgumentError # если параметр не является валидной датой, то вообще обнуляем его
      rp[t] = nil
    end

    # сюда будем собирать ошибки при проверке заявки
    errors = {}

    # попробуем определить имя заказанной модели по её id
    begin
      m = Model.find(rp.model)
      # TODO: это временное решение. Во-первых, код дублируется с модулем FormatableSerializer -
      # - надо делать виртуальный аттрибут в модели; во-вторых, слишком заморочено для простой
      # задачи - целая таблица под два темплейта, использование eval; в-третьих, отсутствие гибкости
      # (невозможно свободно задавать full_name для отдельной Model).
      m.formats.each do |fmt|
        rp[fmt.key.to_sym] = (fmt.format % eval(fmt.args.gsub('$.', 'm.'))).strip
      end
    rescue ActiveRecord::RecordNotFound
      errors[:model] = I18n.t('errors.messages.invalid')
    end

    rp.additions = [] unless rp.additions?
    rp.aas = []

    rp.additions.to_a.each do |a|
      rp.aas << Addition.find(a).name
    rescue ActiveRecord::RecordNotFound
      errors[:additions] = I18n.t('errors.messages.invalid')
    end

    if errors.empty?
      AdminMailer.with(parameters: rp, source: request.host).request_email.deliver_now
      # в настоящий момент отправляем письмо клиенту, если он просто заполнил поле e-mail
      # TODO: анти-спам защита (например, отправлять только для зарегистрированных пользователей или капча)
      # TODO: сделать красивую HTML форму письма в фирменном стиле (сейчас text-only)
      if rp.email.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
        CustMailer.with(parameters: rp).request_email.deliver_now
      end
      render json: { message: I18n.t('request.status.ok') }
    else
      render status: :unprocessable_entity, json: errors
    end
  end

  private

  def req_params
    Hashie::Mash.new(params.permit(:begin_time, :end_time, :model, :last_name, :first_name, :patronymic, :birthdate,
                                   :email, :phone, :doc_number, :doc_issued_by, :doc_issued_date, :doc_registration,
                                   :lic_number, :lic_date, :lic_issued_by, :lic_valid_to, :license_category, :note,
                                   :price, additions: []))
  end
end
