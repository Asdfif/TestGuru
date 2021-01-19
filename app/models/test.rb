class Test < ApplicationRecord

  has_many :questions
  belongs_to :category
  has_many :tests_users
  has_many :users, through: :tests_users

  belongs_to :author, class_name: "User", foreign_key: "author_id"

  def self.category_sort_desc(category_title)
    joins("INNER JOIN categories ON categories.id = tests.category_id")
    .where("categories.title = ?", category_title)
    .order(title: :desc)
    .pluck(:title)
  end

end
