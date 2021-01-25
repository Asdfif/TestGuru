class User < ApplicationRecord

  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, presence: true

  scope :passing_tests, -> (tests_level, user) {
    user.passed_tests
    .where(level: tests_level)
  }
 
  def passing_tests_by_level(tests_level)
    self.class.passing_tests(tests_level, self)
  end

end
