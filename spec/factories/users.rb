FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {123456}

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
