class SessionsController < ApplicationController
  
  skip_before_action :authenticate_user!
  
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id 
      cookies[:target_url] ? redirect_to(cookies[:target_url]) : redirect_to(tests_path)
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
