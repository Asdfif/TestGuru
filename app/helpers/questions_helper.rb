module QuestionsHelper

  def question_header(method, test)

    case method
    when :post
      "Create New <#{test.title}> Question"
    when :patch
      "Edit <#{test.title}> Question"
    end
  end

end
