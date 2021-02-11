class GistQuestionService

  ACCESS_TOKEN = 'ad4393fbae87bb5046b6dfd43353023fbe28f993'.freeze

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ACCESS_TOKEN)
  end

  def call
    @client.create_gist(gist_params)
  end
  
  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }       
    }
  end

  def gist_content
    content = [@question.title]
    content += @question.answers.pluck(:title)
    content.join("\n")
  end

end


# class Octokit::Client 

#   ROOT_ENDPOINT = "https://api.github.com".freeze

#   def initialize
#     # @http_client = setup_http_client
#     access_token: ACCESS_TOKEN
#   end

#   def create_gist(params)
#     post('gists') do |request|
#       request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
#       request.headers['Content-Type'] = 'application/json'
#       request.body = params.to_json
#     end
#   end

#   private

  # def setup_http_client
  #   Faraday.new(url: ROOT_ENDPOINT)
  # end

# end

