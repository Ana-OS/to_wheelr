class Bicycle < ApplicationRecord
  belongs_to :user

  validates :brand, :name, :price_day, :bicycle_type, :location, :number_wheels, presence: true
  validates :name, uniqueness: true
  validates :bicycle_type, inclusion: {in: %w(tandem regular monocycle tricycle elliptical)}
  validates :price_day, numericality: { only_integer: true}
  validates :number_wheels, numericality: { only_integer: true}
end
