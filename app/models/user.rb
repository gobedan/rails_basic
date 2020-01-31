class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :feedbacks
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges
  
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :confirmable,
         :trackable

  def get_tests_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin? 
    self.is_a?(Admin)
  end

  def has_name?
    self.first_name.present? 
  end
end
