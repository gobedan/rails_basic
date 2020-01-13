class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show destroy edit update start update_inline]
  before_action :set_tests, only: %i[index update_inline]
  
  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def index; end

  def show; end

  def edit; end

  def new
    @test = Test.new
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :edit
    end
  end

  def create
    @test = current_user.authored_tests.new(test_params)
    if @test.save 
      redirect_to admin_test_path(@test), notice: t('.success')
    else 
      render :new
    end
  end

  def destroy 
    @test.destroy
    redirect_to admin_tests_path, notice: t('.success')
  end

  private 

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def set_tests
    @tests = Test.all 
  end
end
