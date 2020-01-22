class Feedback
  include ActiveModel::Model
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9-]+.+.[A-Z]{2,4}\z/i

  validates :email, format: { with: EMAIL_REGEX, message: "incorrect format"}, on: :create
  validates :body, presence: true
end
