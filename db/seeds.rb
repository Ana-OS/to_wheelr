# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)
# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)
# require 'faker'
# puts "destroyin bicycles"
# Bicycle.destroy_all
# # User.destroy_all
# # users = []
# # 5.times do
# #   user = User.new(email: Faker::Internet.email, password: SecureRandom.hex(6) )
# #   user.save!
# #   users << user
# # end

# 10.times do
#   bici = Bicycle.new(
#     name: Faker::App.unique.name,
#     price_day: rand(30..80),
#     location: ["New York", "Los Angeles", "San Francisco", "Washington", "Austin"].sample,
#     number_wheels: rand(1..4),
#     brand: Faker::Commerce.brand,
#     bicycle_type: %w(tandem regular monocycle tricycle elliptical).sample,
#     foldable: [true, false].sample
#   )

#   # bici.user = users.sample
#   bici.save!
#   (1 + rand(4)).times do
#     bici.reviews.create!(rating: rand(1..5), comment: Faker::Lorem.sentence(word_count: 5), user: users.sample)
#   end
# end
# puts "done, created #{Bicycle.count} bicis"
