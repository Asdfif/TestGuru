module Badges
  class FinishTestFirstTime < AbstractRuleSpecification

    def satisfies?
      result = false
      if @value && @test_passage.user.badges.where(rule_type: "finish_test_first_time").blank?
        result = @test_passage.user.test_passages.where(test_id: @value).order(updated_at: :asc).first.success == true
      else
        return result
      end
    end

  end
end
