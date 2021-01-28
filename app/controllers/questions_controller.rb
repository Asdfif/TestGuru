class QuestionsController < ApplicationController
  
  before_action :set_test
  before_action :find_question, only: %i[show destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

   def index
    @questions = @test.questions

    render json: @questions
  end

  def show
    
  end

  def new

  end

  def create 
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to test_questions_path
    else
      render :new
    end
  end

  def destroy
    render inline: 'Qestion <%= @question.title %> from test <%= @test.title %> deleted!'

    @question.destroy
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = @test.questions.where(id: params[:id]).first
  end

  def question_params
    test = @test
    params.require(:question).permit(:title).merge! test: test
  end


  def rescue_with_test_not_found
    render plain: "Question was not found"
  end

end
