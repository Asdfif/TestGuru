class Test < ApplicationRecord

  def self.category_sort_desc(category_title)
    joins("INNER JOIN categories ON categories.id = tests.category_id")
    .where("categories.title = ?", category_title)
    .order(title: :desc).pluck(:title)
  end

end
