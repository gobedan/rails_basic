class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result
    new_badges = BadgeService.new(@test_passage).assign_new_badges
    current_user.badges << new_badges
    flash[:notice] = "New achievement unlocked!" if new_badges.present? 
    
  end
  
  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed? 
      redirect_to result_test_passage_path(@test_passage)
    else
       render :show
    end
  end 
  
  def gist
    # строка нужна, тк в условии нам нужно обратиться к тому же экземпляру сервиса для получена статуса последнего запроса
    service = gist_service
    result = service.call
    if service.success?
      @gist = Gist.create(url: result.html_url, hash_code: result.id, 
                                                     user: current_user, 
                                                 question: @test_passage.current_question
                         ) 
      flash[:notice] = t('.success').concat(%Q[<a href="#{@gist.url}"> #{t('.link')}</a>])
    else 
      flash[:alert] = t('.failure') 
    end
    redirect_to @test_passage
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def gist_service
    octokit_client = Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
    GistQuestionService.new(@test_passage.current_question, octokit_client)
  end
end
