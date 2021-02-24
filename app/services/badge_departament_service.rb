class BadgeDepartamentService

  RULES = {
    finish_tests_by_category: FinishTestsByCategory
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type].new(value: badge.rule_value, test_passage: @test_passage)
      add_badge(badge) if rule.satisfies?
    end
  end


  private

  def add_badges(badge)
    @test_passage.user.badges << badge
  end
end