class User < ApplicationRecord

 devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable, 
        :validatable,
        :confirmable,
        :trackable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: "author_id"

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, 
    with: URI::MailTo::EMAIL_REGEXP

  def completed_tests(level)
    Test.joins(:tests_users)
    .by_level(level)
    .where(tests_users: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
