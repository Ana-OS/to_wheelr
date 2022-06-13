class Review < ApplicationRecord
  belongs_to :user
  belongs_to :bicycle
  validates :rating, presence: true
  validates :rating, inclusion: {in: 1..5}
  validates :rating, numericality: {only_integer: true}
end
