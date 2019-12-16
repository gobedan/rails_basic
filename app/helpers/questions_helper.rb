module QuestionsHelper
  def question_header(question)
    if question.new_record?
      'Create new question'
    else
      'Edit question'
    end
  end
end
