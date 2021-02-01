class TestsController < ApplicationController

  after_action :send_log_message

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show
    set_test
  end

  def new
    @test = Test.new
  end

  def create 
    @test = Test.create!(test_params)
    byebug
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def destroy
    set_test

    @test.destroy
    redirect_to tests_path
  end

  def edit
    set_test 
  end

  def update
    set_test
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end 

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
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
