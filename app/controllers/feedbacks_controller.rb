class FeedbacksController < ApplicationController
  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user 
    if @feedback.save
      redirect_to root_path
      AdminMailer.with(user: current_user, text: @feedback.body).feedback.deliver_now
    else
      render :new 
    end
  end

  private
    def feedback_params
      params.require(:feedback).permit(:body)
    end
end
