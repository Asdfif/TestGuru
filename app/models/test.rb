class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  def self.category_sort_desc(category_title)
   joins(:category)
    .where(categories: {title: category_title})
    .order(title: :desc)
    .pluck(:title)
  end

end
