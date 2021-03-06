class Question < ApplicationRecord
  belongs_to :test
  has_many :test_passages, class_name: 'TestPassage', foreign_key: :current_question_id
  has_many :answers, dependent: :destroy

  validates :body, presence: true 
end
