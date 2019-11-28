class SessionsController < ApplicationController
  
  skip_before_action :authenticate_user!

  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to cookies.delete(:target_url) || tests_path
    else
      flash_alert_wrong_credentials
      render :new
    end
  end

  def destroy 
    reset_session
    cookies.clear
    redirect_to root_path
  end 
end
