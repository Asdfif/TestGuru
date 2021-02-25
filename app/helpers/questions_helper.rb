module QuestionsHelper

  def question_header(test)
    if @question.persisted?
      t('.edit', title: test.title)
    else
      t('.new', title: test.title)
    end
  end

end
