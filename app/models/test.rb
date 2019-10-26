class Test < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', optional: true
  has_many :questions, dependent: :destroy
  has_many :user_tests, dependent: :destroy
  has_many :users, through: :user_tests

  scope :easy, -> { where(level: 0..1) }
  scope :normal, -> { where(level: 2..4) }
  scope :hard, -> { where("level >= ?", 5) }
  scope :by_level, -> (level) { where("level = ?", level) }
  scope :from_category, -> (category) do 
    joins(:category)
    .where(categories: {title: category})
    .order('categories.title DESC')
  end    

  validates :title, presence: true 
  validates :level, inclusion: { in: 0..Float::INFINITY }, 
                    numericality: { only_integer: true }
  validates_uniqueness_of :title, scope: :level 
end
