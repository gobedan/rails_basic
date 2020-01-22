class FeedbacksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :disable_layout
  # GET /feedbacks/new
  def new
    @feedback = Feedback.new
  end

  # POST /feedbacks
  def create
    @feedback = Feedback.new(feedback_params) 
    if @feedback.valid? 
      AdminMailer.with(email: @feedback.email, text: @feedback.body).feedback.deliver_now
    end
    respond_with @feedback, location: new_feedbacks_path
  end

  private
    def feedback_params
      params.require(:feedback).permit(:body, :email)
    end

    def disable_layout
      render layout: false
    end
end
