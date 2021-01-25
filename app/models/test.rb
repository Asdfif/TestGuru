class Test < ApplicationRecord

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: "author_id"

  has_many :questions, dependent: :destroy
  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users

  validates :title, presence: true
  validates :title, uniqueness: {scope: :level}
  validates_numericality_of :level, {
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    only_integer: true
  }

  scope :by_difficult, -> (difficulty) { where( level: levels_by_difficult( difficulty ) ) } 
  scope :by_category_title, -> (category_title) { joins(:category)
    .where(categories: { title: category_title })
  }

  def self.category_sort_desc (category_title)
   by_category_title(category_title).order(id: :desc).pluck(:title)
  end

  def self.levels_by_difficult(value)
    case value
    when "easy"
      (0..1) 
    when "medium"
      (2..4)
    when "hard"
      (5..Float::INFINITY)
    end
  end  

end
