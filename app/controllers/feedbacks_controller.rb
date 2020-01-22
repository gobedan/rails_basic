class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!

  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params) 
    if @feedback.valid?
      AdminMailer.with(email: @feedback.email, text: @feedback.body).feedback.deliver_now 
      if current_user
        flash[:notice]="Feedback send successfully!"
        redirect_to root_path 
      else
        flash.now[:notice]="Feedback send successfully!"
        render :new
      end
    else
      flash.now[:alert]="something wrong"
      render :new
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:body, :email)
    end
end
