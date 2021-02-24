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
  has_many :badge_assignings, dependent: :destroy
  has_many :badges, through: :badge_assignings

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, 
    with: URI::MailTo::EMAIL_REGEXP

  def completed_tests(level)
    Test.joins(:tests_users)
    .by_level(level)
    .where(tests_users: { user_id: id })
  end

  def badge_deserved
    user_successful_tests_ids = test_passages.where(success: true).pluck(:test_id)
    Badge.all.each { |badge|
      if (badge.tests_ids - user_successful_tests_ids).empty?
        byebug
        self.badges << badge
      end
    }
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

end
