class TestsController < ApplicationController

  after_action :send_log_message

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    result = Test.pluck(:title)

    render plain: result.join("\n")
  end

  def show
    set_test
    render inline: '<%= @test.title %>' 
  end

  def new; end

  def create 
    test = Test.create(test_params)
    if test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def search
    result = ["Class: #{params.class}","Parameters: #{params.inspect}"]

    render plain: result.join("\n")
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def send_log_message
    logger.info("Action [#{action_name}] was finished")
  end

  def rescue_with_test_not_found
    render plain: "Test was not found"
  end

end
