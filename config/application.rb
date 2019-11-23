# config/application.rb
require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
# require 'action_cable/engine'
# require 'sprockets/railtie'
# require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RentAuto
  # Application
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Initialize modules from lib
    config.eager_load_paths << Rails.root.join('lib')

    # The safest solution in API-only application is not to rely on Rails session at all and disable it.
    config.middleware.delete ActionDispatch::Session::CookieStore

    # Locales
    config.i18n.available_locales = %i[en ru]
    config.i18n.default_locale = :ru
    # config.time_zone = 'Moscow'

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
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
end
