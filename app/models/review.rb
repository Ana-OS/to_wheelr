class Review < ApplicationRecord
  belongs_to :bicycle
  belongs_to :user
  validates :rating, presence: true
  validates :rating, inclusion: {in: 1..5}
  validates :rating, numericality: {only_integer: true}
end
