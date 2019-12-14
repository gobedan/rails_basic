class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end
  
  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? 
      redirect_to result_test_passage_path(@test_passage)
    else
       render :show
    end
  end 
  
  def gist
    result = call_gist_service
    # result.class = Sawyer::Resource - json созданного ресурса
    #  нашел как грамотно проверить result на успех. Вместо result работать с рейлс-объектом response ? 
    if response.successful?  
      # ссылка все равно отображается текстом, хотя flash.notice.class = ActiveSupport.SafeBuffer
      flash[:notice] = t('.success').concat(%Q[<a href="#{result.html_url}"> #{t('.link')}</a>]).html_safe
    else 
      flash[:alert] = t('.failure') 
    end
    byebug
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def call_gist_service
    octokit_client = Octokit::Client.new(access_token: GitHubClient::ACCESS_TOKEN)
    GistQuestionService.new(@test_passage.current_question, client: octokit_client).call
  end
end
