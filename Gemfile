source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'

# Ruby Internationalization and localization solution.
gem 'i18n'
gem 'rails-i18n'

# This library provides integration of the money gem with Rails.
gem 'money'
gem 'money-rails'

# Supplies TimeOfDay class that includes parsing, strftime, comparison, and arithmetic.
# gem 'tod' #, '~> 2.2'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10.8'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', '~> 1.0', '>= 1.0.2', require: 'rack/cors'

# Autoload dotenv in Rails.
gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # An IRB alternative and runtime developer console
  gem 'pry' # , '~> 0.10.3'
  # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue' and 'break' commands to control execution.
  gem 'pry-byebug' # , '~> 3.6'
  # BDD for Ruby
  gem 'rspec-rails' # , '~> 3.8'
  # gem 'rspec', '~> 3.8'
  # Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop', require: false
  # Faker is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker' # , require: false
  gem 'ffaker', require: false
  # Faker russian specific values. INN, OKPO, OGRN et.c.
  # (пока нет генерации паспортов он для нас беполезен)
  # gem 'faker-russian'
  # Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure.
  gem 'awesome_print'
  # Rails ERD generates diagrams using Graphviz, a visualisation library.
  gem 'rails-erd'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
