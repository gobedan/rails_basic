class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', dependent: :nullify
  has_many :user_tests,  dependent: :destroy
  has_many :tests, through: :user_tests

  def get_tests_by_level(level)
    tests.select { |test| test.level == level } 
  end
end
