module TestPassagesHelper

  def success?
    if @test_passage.percent_of_success < 0.85
      false
    else
      true
    end
  end

  def questions_left(current_question)
    test_questions = @test_passage.test.questions
    "[#{test_questions.index(current_question) + 1} / #{test_questions.size}]"
  end 

end
