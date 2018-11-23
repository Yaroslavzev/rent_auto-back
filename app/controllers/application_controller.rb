# app/controllers/application_controller.rb
# ApplicationController
class ApplicationController < ActionController::API
  respond_to :json

  before_action :authenticate_user!, except: %i[show index]
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
