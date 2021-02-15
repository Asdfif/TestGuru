class GistsController < ApplicationController

  before_action :authenticate_user!

  def create
    set_test_passage

    question = @test_passage.current_question

    url_gist = GistQuestionService.new(question).call.html_url
    if url_gist.present?
      flash[:notice] = t('.success', url: url_gist, question_title: question.title)
      Gist.create!(gist_url: url_gist, user: current_user, question: question)
    else
      flash[:alert] = t('.failure') 
    end
    redirect_to @test_passage
  end

  private 

  def  set_test_passage
    @test_passage = TestPassage.find(params[:test_passage_id])
  end

end
