class Bicycle < ApplicationRecord
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  validates :name, :location, :price_day, :brand, :number_wheels, :bicycle_type, presence: true
  validates :foldable, inclusion: { in: [true, false]}
  validates :bicycle_type, inclusion: { in: %w(tandem regular monocycle tricycle elliptical)}
  validates :number_wheels, :price_day, numericality: { only_integer: true }
end
