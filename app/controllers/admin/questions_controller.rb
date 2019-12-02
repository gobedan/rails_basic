class Admin::QuestionsController < Admin::BaseController
  before_action :set_question, only: %i[show destroy edit update]
  before_action :set_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_record_rescuer
  
  def show; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save 
      # не работает через redirect_to @question - отсылает к хэлперу question_url и падает с исключением
      redirect_to admin_question_path(@question) 
    else 
      render :new
    end
  end

  def edit; end
  
  def update
    if @question.update(question_params)
      redirect_to admin_question_path(@question) 
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test)
  end

  private 

  def question_params
    params.require(:question).permit(:body)
  end
  
  def set_question
    @question = Question.find(params[:id])
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_record_rescuer(ex)
    render plain: ex.message
    logger.info(ex.inspect)
    logger.info('FROM rescue_with_handler')
  end
end
