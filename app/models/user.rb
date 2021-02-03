class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, presence: true

  def completed_tests(level)
    Test.joins(:tests_users)
    .by_level(level)
    .where(tests_users: {user_id: id})
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
