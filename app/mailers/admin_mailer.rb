# Дефолтный мейлер для отправки писем администратору проката
class AdminMailer < ApplicationMailer
  def request_email
    @p = params[:parameters]
    mail(to: ENV['ADMIN_EMAIL'], subject: format(I18n.t('mailer.subjects.request.new'),
                                                 site: Rails.configuration.site_name, host: params[:source]))
  end
end
