class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :passed_tests, through: :tests_users
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, presence: true

  def completed_tests(level)
    Test.joins(:tests_users)
    .by_level(level)
    .where(tests_users: {user_id: id})
  end

end
