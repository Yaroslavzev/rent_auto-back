# config/enviroment.rb
# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Rails.application.configure do
  config.action_mailer.smtp_settings = {
    address: ENV['SMTP_SERVER'],
    port: ENV['SMTP_PORT'],
    domain: ENV['SMTP_DOMAIN'],
    user_name: ENV['SMTP_LOGIN'],
    password: ENV['SMTP_PASSWORD'],
    authentication: ENV['SMTP_AUTH']
  }
  config.action_mailer.default_options = { from: ENV['MAIL_FROM'] }

  # наименование проекта, используется, как минимум, в почте. Может быть просто адресом сайта.
  # Пример: config.site_name = 'Тачка96'
  config.site_name = 'Rent Auto'

  # Шаблон для динамической генерации полного имени модели авто
  # Это правильный шаблон, но он не соответствует нынешней админке и заполнению баз. Поправить там и вернуть
  # config.model_full = '<%= brand %> <%= model %> <%= body %> <%= volume %> <%= style %> (<%= cls %> класс)'
  # Шаблон, отражающий статус-кво
  config.model_full = '<%= brand %> <%= model %> <%= cls %> <%= volume %> <%= style %>'
end
