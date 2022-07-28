class User < ApplicationRecord
  has_secure_password
  has_many :bicycles
  has_many :reviews
end
