# мейлер для отправки писем клиенту
class CustMailer < ApplicationMailer
  def request_email
    @p = params[:parameters]
    mail(to: @p.email, subject: I18n.t('mailer.subjects.request.got-it') % {site: Rails.configuration.site_name})
  end
end
