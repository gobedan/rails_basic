class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
    @response_status = 0
  end

  def call 
    result = @client.create_gist(gist_params)
    @response_status = result.status
  end

  def success?
    @response_status == CREATED_STATUS
  end

  private

  CREATED_STATUS = 201 

  def default_client
    GitHubClient.new
  end

  def gist_params
    {
      description: I18n.t('services.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
            content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
