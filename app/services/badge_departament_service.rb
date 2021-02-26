class BadgeDepartamentService

  RULES = {
    finish_tests_by_category: Badges::FinishTestsByCategory,
    finish_tests_by_level: Badges::FinishTestsByLevel,
    finish_test_first_time: Badges::FinishTestFirstTime
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type.to_sym].new(badge.rule_value, @test_passage)
      if rule.satisfies?
        add_badges(badge)
      end
    end
  end

  private

  def add_badges(badge)
    @test_passage.user.badges.push(badge)
  end
end
