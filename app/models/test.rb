class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true
  validates :title, uniqueness: {scope: :level}
  validates :level, numericality: {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    only_integer: true
  }
  validates :timer, numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }

  scope :by_level, -> (level) { where(level: level) }
  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }
  scope :by_category_title, -> (category_title) { joins(:category)
    .where(categories: { title: category_title })
  }

  def self.category_sort_desc (category_title)
   by_category_title(category_title).order(id: :desc).pluck(:title)
  end

end
