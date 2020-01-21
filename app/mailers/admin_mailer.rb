class AdminMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def feedback
    @user = params[:user]
    @feedback_text = params[:text]
    mail(subject: "Feedback")
  end
end
