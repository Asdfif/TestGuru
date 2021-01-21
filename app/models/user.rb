class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :own_tests, class_name: "Test", foreign_key: "author_id", dependent: :destroy
 
  def completed_tests(level)
    Test.joins(:tests_users)
    .where(tests: {level: level})
    .where(tests_users: {user_id: self.id})
  end

end
