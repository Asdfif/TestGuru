module Badges
  class FinishTestsByCategory < AbstractRuleSpecification
    def satisfies?
      users_success_tests = TestPassage.successful_tests(@test_passage.user).to_a.map { |tp| tp = tp.test }
      users_success_tests.uniq!
      if @value 
        result = (Category.find(@value).tests.to_a - users_success_tests).blank?
      else
        result = (Test.all.to_a - users_success_tests).blank?
      end
      return result
    end
  end
end
