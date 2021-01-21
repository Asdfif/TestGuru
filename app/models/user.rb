class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy

  has_many :tests, through: :tests_users
  
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"
 
  def completed_tests(level)
    Test.joins(:tests_users)
    .where(level: level)
    .where(tests_users: {user_id: id})
  end

end
