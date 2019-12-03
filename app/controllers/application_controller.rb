class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :flash_alert_unauthorized, 
                :flash_alert_wrong_credentials,
                :flash_message_greetings

  before_action :authenticate_user!

  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private

  def flash_alert_unauthorized
    flash[:alert] = 'You are not Guru yet! Please login!'
  end

  def flash_alert_wrong_credentials
    flash.now[:alert] = 'Are you a Guru? Wrong credentials!'
  end

  def flash_message_greetings
    flash[:notice] = "Hello, #{current_user.first_name}" if current_user.has_name? 
  end

  def after_sign_in_path_for(user)
    if user.admin?
      admin_tests_path
    else
      super
    end
  end
end
