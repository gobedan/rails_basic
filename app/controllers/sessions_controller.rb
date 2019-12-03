class SessionsController < Devise::SessionsController
  def create
    super
    flash_message_greetings
  end
end
