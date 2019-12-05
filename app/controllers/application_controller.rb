class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :flash_message_greetings

  before_action :authenticate_user!
  before_action :set_locale 

  def default_url_options
    { lang: I18n.locale != I18n.default_locale ? I18n.locale : nil }
  end

  protected 

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

  private

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

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end
