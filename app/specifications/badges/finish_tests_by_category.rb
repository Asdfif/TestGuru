module Badges
  class FinishTestsByCategory < AbstractRuleSpecification
    
    def satisfies?
      user_badges_count = @test_passage.user.badges.where(rule_type: "finish_tests_by_category", rule_value: @value).count

      users_success_tests = TestPassage.successful_tests(@test_passage.user).map { |tp| tp = tp.test }

      result = true
      case @value
      when nil
        hash_success_tests = users_success_tests.map { |test| [test, users_success_tests.to_a.count(test)] }.uniq!.to_h

        Test.find_each do |test| 
          result = false if hash_success_tests[test].nil?
        end
      else
        array_success_tests = users_success_tests - Test.where.not(category_id: @value).to_a
        hash_success_tests = array_success_tests.map { |test| [test, array_success_tests.count(test)] }.uniq!.to_h
        Test.where(category_id: @value).to_a.each do |test| 
          result = false if hash_success_tests[test].nil?
        end
      end

      if result
        hash_success_tests.each do |k,v| 
          @min_success_tests ||= v
          @min_success_tests = v if @min_success_tests > v
        end
      result = false if user_badges_count >= @min_success_tests      
      end

      return result
    end

  end
end
