module QuestionsHelper
  def question_header 
    if params[:action] == "new"
      'Create new question'
    elsif params[:action] == "edit"
      'Edit question'
    end
  end
end
