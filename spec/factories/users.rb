FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    password_digest { 123456 }
    email {Faker::Internet.email }

    transient do
      qtt_bicycles {2}
    end

    trait :with_bicycles do
      after(:build) do |user, evaluator|
        create_list(:bicycle, evaluator.qtt_bicycles, user: user)
      end
    end
  end
end
