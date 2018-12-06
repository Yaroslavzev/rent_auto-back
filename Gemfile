source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# MySQL for export to PSoft
gem 'mysql2'
# Use Puma as the app server
gem 'puma'

# Ruby Internationalization and localization solution.
gem 'i18n'
gem 'rails-i18n'

# This library provides integration of the money gem with Rails.
gem 'money'
gem 'money-rails'

# Supplies TimeOfDay class that includes parsing, strftime, comparison, and arithmetic.
# gem 'tod'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'

# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers' # , github: "rails-api/active_model_serializers"

# Use ActiveModel has_secure_password
gem 'bcrypt' # , '~> 3.1.7'

# An authentication library compatible with all Rack-based frameworks
gem 'warden' # , '~> 1.2', '>= 1.2.8'

# Flexible authentication solution for Rails with Warden
gem 'devise' # , '~> 4.5'
gem 'devise-i18n'

# JWT authentication for devise with configurable token revocation strategies
# gem 'devise-jwt' # , '~> 0.5.8'

# Token authentication for Devise which supports multiple tokens per model
gem 'tiddle' # , '~> 1.3'

# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard.
# gem 'jwt' # , '~> 2.1'

# Object oriented authorization for Rails applications
gem 'pundit' # , '~> 2.0'

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

# Hash extensions
gem 'hashie', '~> 3.6'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  # An IRB alternative and runtime developer console
  gem 'pry'
  # Combine 'pry' with 'byebug'. Adds 'step', 'next', 'finish', 'continue' and 'break' commands to control execution.
  gem 'pry-byebug'
  # BDD for Ruby
  gem 'rspec-rails'
  # gem 'rspec', '~> 3.8'
  # Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide.
  gem 'rubocop', require: false
  # Faker is used to easily generate fake data: names, addresses, phone numbers, etc.
  gem 'faker' # , require: false
  # Faker russian specific values. INN, OKPO, OGRN et.c.
  # (пока нет генерации паспортов он для нас беполезен)
  # gem 'faker-russian'
  # Great Ruby dubugging companion: pretty print Ruby objects to visualize their structure.
  gem 'awesome_print'
  # Rails ERD generates diagrams using Graphviz, a visualisation library.
  gem 'rails-erd'
  # где хистори?
  gem 'rb-readline'
  # для локального чтения писем вместо отправки
  gem 'letter_opener'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
