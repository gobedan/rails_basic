class AdminMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def feedback
    @email = params[:email]
    @feedback_text = params[:text]
    mail(subject: "Feedback")
  end
end
