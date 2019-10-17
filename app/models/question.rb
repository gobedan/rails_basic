class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true 
  validate :answers_count

  private

  def answers_count 
    unless answers.size.between?(1, 4)
      errors.add(:answers, message: 'answers count not in 1..4 range')
    end
  end
end
