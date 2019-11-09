class QuestionsController < ApplicationController
  before_action :get_question, only: %i[show destroy edit update]
  before_action :get_test, only: %i[new create index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_rescuer
  def index
  end

  def show 

    raise 'Question not found!' unless @question

  end

  def new
    #app/views/questions/new.html.erb
    @question = Question.new 
  end

  def create
    @question = @test.questions.create(question_params)
    if @question.save 
      redirect_to @question 
    else 
      render :new
    end
  end

  def edit
  end
  
  def update
    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    render :index
  end

  private 

  def question_params
    params.require(:question).permit(:body)
  end
  
  def get_question
    @question = Question.find(params[:id])
    @test = @question.test
  end

  def get_test
    @test = Test.find(params[:test_id])
  end

  #Почему-то продолжает отлавливать все исключения
  def rescue_with_record_rescuer(ex)
    render plain: ex.message
    logger.info(ex.inspect)
    logger.info('FROM rescue_with_handler')
  end
end
