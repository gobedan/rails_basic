class User < ApplicationRecord
  has_many :authored_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :user_tests,  dependent: :destroy
  has_many :tests, through: :user_tests
  #в моей схеме по логике name вместо email 
  validates :name, presence: true 


  def get_tests_by_level(level)
    if level >= 4 
      tests.hard 
    elsif level >= 2 && level <= 4
      tests.normal
    elsif level >= 0 
      tests.easy
    end
  end
end
