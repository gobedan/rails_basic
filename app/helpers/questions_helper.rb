module QuestionsHelper
  def question_header(question)
    if question.new_record?
      'Create new question'
    else
      'Edit question'
    end
  end

  def question_body_shallow(question)
    if question.body.size > 25
      question.body[0..25]+"..."
    else
      question.body
    end
  end
end
