class QuestionsController < ApplicationController
  before_action :get_question, only: %i[show destroy]
  before_action :get_test, only: %i[new create index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_handler
  
  def index
    render plain: @test.questions.inspect
  end

  def show 

    raise 'Question not found!' unless @question

    render plain: @question.inspect
  end

  def new
    #app/views/questions/new.html.erb
  end

  def create
    @question = @test.questions.create(question_params)
    show
  end

  def destroy
    @question.destroy
  end

  private 

  def question_params
    params.require(:question).permit(:body)
  end
  
  def get_question
    @question = Question.find(params[:id])
  end

  def get_test
    @test = Test.find(params[:test_id])
  end

  #Почему-то продолжает отлавливать все исключения
  def rescue_with_handler(ex)
    render plain: ex.message
    logger.info(ex.inspect)
  end
end
