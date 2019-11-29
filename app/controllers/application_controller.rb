class ApplicationController < ActionController::Base

  helper_method :flash_alert_unauthorized, :flash_alert_wrong_credentials

  before_action :authenticate_user!

  private

  def flash_alert_unauthorized
    flash[:alert] = 'You are not Guru yet! Please login!'
  end

  def flash_alert_wrong_credentials
    flash.now[:alert] = 'Are you a Guru? Wrong credentials!'
  end
end
