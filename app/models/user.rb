class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests,  dependent: :destroy
  has_many :tests, through: :user_tests
  
  validates :email, presence: true 

  scope :tests_by_level, -> (level) { where(level: level) }
end
