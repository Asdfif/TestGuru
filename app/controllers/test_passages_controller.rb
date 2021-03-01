class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[gist show update result]

  def show
    if @test_passage.time_is_over?
      @test_passage.update(success: false)
      redirect_to result_test_passage_path(@test_passage)
    end
  end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      @test_passage.set_result
      BadgeDepartamentService.new(@test_passage).call
      redirect_to result_test_passage_path(@test_passage)
    else
      redirect_to @test_passage
    end
  end

  private 

  def  set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
  