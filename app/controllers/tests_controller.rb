class TestsController < ApplicationController

  before_action :find_test, only: %i[show]
  after_action :send_log_message
  # around_action :log_execute_time

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index

    # render plain: 'All tests'

    # render html: '<h1>All tests</h1>'.html_safe
  
    # render json: { tests: [Test.all] }

    # render inline: '<p>My favorite language id: <%= %[ybuR].reverse! %>!</p>'

    # render file: 'public/about.html', layout: false
    
    # head :no_content

    # byebug

    # render inline: '<%= console %>'

    # respond_to do |format|
    #   format.html { render plain: "All tests" }
    #   format.json  { render json: { tests: [Test.all] } }
    # end


    # ПАРМЕТРЫ ЗАПРОСА

    result = ["Class: #{params.class}","Parameters: #{params.inspect}"]

    render plain: result.join("\n")

    # /tests?data[][level]=1&data[][level]=2
    # => "data"=>[{"level"=>"1"}, {"level"=>"2"}]

    # ПРОСМОТР СПИСКА
    # render inline: '<%= TestsController.all_tests %>'#result.join("\n")
  
  end

  def show

    # title = Test.first.title

    render inline: '<%= @test.title %>' 

  end

  def new

  end

  def create 
    # result = ["Class: #{params.class}","Parameters: #{params.inspect}"]

    # render plain: result.join("\n")
    
    test = Test.create!(test_params)
    
    render plain: test.inspect
  end

  # ПОИСК
  def search
    result = ["Class: #{params.class}","Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def find_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  # def log_execute_time
  #   start = Time.now
  #   yield
  #   finish = Time.now - start

  #   logger.info("Execution time: #{finish * 1000}ms")
  # end

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end

  def self.all_tests
    Test.all.map do |test|
      test.title
    end
  end

end
