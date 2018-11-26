# app/controllers/auth/sessions_controller.rb
module Auth
  # Auth::SessionsController
  class SessionsController < Devise::SessionsController
    delegate :t, to: I18n
    # before_action :configure_sign_in_params, only: [:create]

    # GET /resource/sign_in
    # def new
    #   super
    # end

    # POST /resource/sign_in
    # def create
    #   super
    # end
    def create
      user = warden.authenticate!(auth_options)
      token = Tiddle.create_and_return_token(user, request, expires_in: 3.days)
      render json: { email: user.email, authentication_token: token, message: t('devise.sessions.signed_in') }
    end

    # DELETE /resource/sign_out
    # def destroy
    #   super
    # end
    def destroy
      Tiddle.expire_token(current_user, request) if current_user
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
