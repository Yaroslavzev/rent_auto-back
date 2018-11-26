# app/controllers/application_controller.rb
# ApplicationController
class ApplicationController < ActionController::API
  include Pundit

  respond_to :json

  # protect_from_forgery with: :null_session

  before_action :authenticate_user!, except: %i[show index]
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
