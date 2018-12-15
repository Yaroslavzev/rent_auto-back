# мейлер для отправки писем клиенту
class CustMailer < ApplicationMailer
  def request_email
    @p = params[:parameters]
    return unless @p.email&.match?(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)

    mail(to: @p.email, subject: format(I18n.t('mailer.subjects.request.got-it'), site: Rails.configuration.site_name))
  end
end
