class Feedback
  include ActiveModel::Validations, ActiveModel::Model
  EMAIL_REGEX = /\A.+@.+$\z/
  attr_accessor :body, :email
  validates :email, format: { with: EMAIL_REGEX, message: "incorrect format"}
  validates :body, presence: true
end
