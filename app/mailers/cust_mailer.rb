# мейлер для отправки писем клиенту
class CustMailer < ApplicationMailer
  MAIL_CHECK = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze

  def request_email
    @p = params[:parameters]
    return unless @p.email&.match? MAIL_CHECK

    mail(to: @p.email, subject: format(I18n.t('mailer.subjects.request.got-it'), site: Rails.configuration.site_name))
  end
end
