class Badge < ApplicationRecord

  has_many :badge_assignings, dependent: :destroy
  has_many :users, through: :badge_assignings

  validates :title, presence: true
  validates :rule_type, presence: true
  validates :rule_type, uniqueness: {scope: :rule_value}

end
