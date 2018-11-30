# Контроллер заявок (запросов) на аренду
class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:create]

  # POST /requests
  # POST /requests.json
  def create
    # rp - request parameters
    rp = Hashie::Mash.new(params)
    # TODO: это временно до 01.11.18 - M.L. заменит model_name на model (и урежет список полей)
    rp.model = Hashie::Mash.new(rp.model_name? ? rp.model_name : rp.model)

    rp.additions = [] unless rp.additions?
    # TODO: после 01.11.18 тут вообще не будет от фронта строк, всегда хэш. Template тоже упростить.
    rp.additions.map! { |aas| aas.instance_of?(String) ? aas : Hashie::Mash.new(aas) }

    %i[begin_time end_time birthdate doc_issued_date lic_date lic_valid_to].each do |t|
      rp[t] = Time.iso8601(rp[t]) if rp[t]
    rescue ArgumentError # если параметр не является валидной датой, то вообще обнуляем его
      rp[t] = nil
    end

    AdminMailer.with(parameters: rp, source: request.host).request_email.deliver_now
    # в настоящий момент отправляем письмо клиенту, если он просто заполнил поле e-mail
    # TODO: проверять адрес на валидность
    # TODO: анти-спам защита (например, отправлять только для зарегистрированных пользователей или капча)
    # TODO: сделать красивую HTML форму письма в фирменном стиле (сейчас text-only)
    CustMailer.with(parameters: rp).request_email.deliver_now if rp.email?
  end
end
