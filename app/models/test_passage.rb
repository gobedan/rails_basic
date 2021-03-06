class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  scope :completed,  -> do 
    where(current_question: nil)
  end

  scope :successful, -> do 
    where(success: true)
  end

  def timed_out? 
    Time.now > created_at.advance(minutes: test.time) 
  end 

  def completed? 
    current_question.nil? 
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids) 
    self.success = successful? 
    save!
  end

  def current_question_number
    test.questions.ids.index(current_question_id) + 1
  end

  def result 
    correct_questions.to_f / test.questions.count
  end

  def successful?
    result > SUCCESS_RATIO 
  end

  def result_percents
    "#{(result * 100).to_i}%" 
  end

  private

  SUCCESS_RATIO = 0.85

  def before_validation_set_current_question
    # Основной критерий завершенности тест - отсутствие текущего вопроса
    # По-этому добавил проверку на таймаут сюда а не в акцепт
    # иначе пришлось бы переписывать next_question добавляя туда неочевидные сложные проверки
    if persisted? && test&.time.present? && timed_out?
      self.current_question = nil 
    elsif test.present?
      self.current_question = next_question
    end
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).reject(&:empty?).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    if new_record?
      prev_id = 0
    else
      prev_id = current_question.id
    end
    test.questions.order(:id).where('id > ?', prev_id).first
  end

end
