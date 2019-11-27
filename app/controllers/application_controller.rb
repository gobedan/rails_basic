class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  helper_method :flash_alert_unauthorized, :flash_alert_wrong_credentials

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless current_user 
      # стайлгайд рекомендует избегать лишних ретурнов. Насколько уместно это здесь?
      flash_alert_unauthorized
      redirect_to login_path 
      cookies[:target_url] = request.original_url
    end
    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def flash_alert_unauthorized
    flash[:alert] = 'You are not Guru yet! Please login!'
  end

  def flash_alert_wrong_credentials
    flash.now[:alert] = 'Are you a Guru? Wrong credentials!'
  end
end
