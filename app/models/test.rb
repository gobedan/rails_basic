class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions, dependent: :nullify
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  def self.get_by_category(category)
    Test.joins(:category)
        .where(categories: {title: category})
        .pluck(:title)  

  end
end
