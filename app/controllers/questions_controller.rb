class QuestionsController < ApplicationController
  before_action :permit_params
  before_action :get_associated_test
  before_action :get_question, only: %i[show destroy]


  rescue_from StandardError, with: :rescue_with_handler
  
  def index
    render plain: @test.questions.inspect
  end

  def show 

    raise 'Question not found!' unless @question

    render plain: @question.inspect
    byebug
  end

  def new
  end

  def create
  end

  def destroy
    @question.destroy
  end

  private 
  
  def get_question
    @question = @test.questions.find_by(id: @ids[:id])
  end

  def permit_params
    @ids = params.permit(:test_id, :id)
  end

  def get_associated_test
    @test = Test.find_by(id: @ids[:test_id])
  end

  def rescue_with_handler(ex)
    render plain: ex.message
    logger.info(ex.inspect)
  end




end
