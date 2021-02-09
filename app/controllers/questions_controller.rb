class QuestionsController < ApplicationController
  
  before_action :authenticate_user!, except: :show

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show
    set_question
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: "Question was not found"
  end

end
