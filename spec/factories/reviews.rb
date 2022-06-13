FactoryBot.define do
  factory :review do
    rating { 3 }
    comment { Faker::Lorem.sentence(word_count: 5) }
    user
    bicycle
  end
end
