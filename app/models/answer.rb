class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true 
  validate :answers_count

  def answers_count
    unless question.answers.count.between?(0, 3)
        errors.add(:question, message: 'answers count for linked question is not in 1..4 range')
    end
  end
end
