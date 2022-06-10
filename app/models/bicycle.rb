class Bicycle < ApplicationRecord
  belongs_to :user
  validates :name, :location, :price_day, :brand, :number_wheels, :bicycle_type, :foldable, presence: true
end
