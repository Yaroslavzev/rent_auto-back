# Контроллер заявок (запросов) на аренду
class RequestsController < ApplicationController
  # POST /requests
  # POST /requests.json
  def create
    AdminMailer.with(parameters: params).request_email.deliver_now
    # Rails.logger.info params[:begin_time]
  end
end
