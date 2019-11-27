require 'digest/sha1'

class User < ApplicationRecord

  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  has_secure_password 

  validates :email, format: { with: EMAIL_REGEX, message: "incorrect format"}, on: :create
  validates :email, uniqueness: true

  def get_tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end


end
