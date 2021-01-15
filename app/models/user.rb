class User < ApplicationRecord

  def completed_tests(level)
    Test.joins("JOIN user_tests ON user_tests.test_id = tests.id").where("tests.level = ?", level).where("user_tests.user_id = ?", self.id)
  end

end
