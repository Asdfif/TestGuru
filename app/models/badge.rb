class Badge < ApplicationRecord

  has_many :badge_assignings, dependent: :destroy
  has_many :users, through: :badge_assignings

end
