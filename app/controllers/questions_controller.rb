class QuestionsController < ApplicationController
  
  before_action :set_test,     only: %i[index new create]
  before_action :set_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = Question.new
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render :edit
    end
  end

  def create 
    byebug
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to test_path(id: @question.test_id)
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :test)
  end


  def rescue_with_question_not_found
    render plain: "Question was not found"
  end

end
