# app/controllers/auth/sessions_controller.rb
module Auth
  # Auth::SessionsController
  class SessionsController < Devise::SessionsController
    delegate :t, to: I18n
    before_action :authenticate_user!, only: %i[check destroy]
    # before_action :configure_sign_in_params, only: [:create]

    # GET /auth/sign_in
    # def new
    #   super
    # end

    # POST /auth/sign_in
    def create
      user = warden.authenticate!(auth_options)
      Tiddle.expire_token(user, request) if request.headers['X-USER-EMAIL'] && request.headers['X-USER-TOKEN']
      Tiddle.purge_old_tokens(user)
      token = Tiddle.create_and_return_token(user, request, expires_in: 3.days)
      render json: { user: user.as_json, authentication_token: token, message: t('devise.sessions.signed_in') }
    end

    # GET /auth/check_in
    # для проверки валидности аутентификационных данных из headers (X-USER-EMAIL и X-USER-TOKEN)
    # возвращает пользователя, которому принадлежат эти аутентификационные данные
    def check_in
      user = warden.authenticate!(auth_options)
      render json: { user: user.as_json, message: t('devise.sessions.signed_in') }
    end

    # DELETE /auth/sign_out
    def destroy
      Tiddle.expire_token(current_user, request) if current_user
      Tiddle.purge_old_tokens(current_user) if current_user
      render json: { message: t('devise.sessions.signed_out') }
    end

    private

    # this is invoked before destroy and we have to override it
    def verify_signed_out_user; end

    # protected

    # If you have extra params to permit, append them to the sanitizer.
    # def configure_sign_in_params
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    # end
  end
end
