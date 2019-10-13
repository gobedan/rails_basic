class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :user_tests
  has_many :users, through: :user_tests

  def self.get_by_category(category)
    Test.joins('JOIN categories as cat ON category_id = cat.id')
        .where(cat: {title: category})
        .pluck(:title)         
  end
end
