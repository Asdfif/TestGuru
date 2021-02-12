class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[gist show update result]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end
  
  def gist
    question = @test_passage.current_question

    result = GistQuestionService.new(question).call
    
    urt_gist = result.html_url
    
    flash_options = if result
      { notice: t('.success', 
                  url: "#{ view_context.link_to "#{ url_gist }", url_gist }.".html_safe
                 )
      }
    
      Gist.create!(gist_url: url_gist, user: current_user, question: question)
    else
      { alert: t('.failure') }
    end
    
    redirect_to @test_passage, flash_options
  end

  private 

  def  set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
  