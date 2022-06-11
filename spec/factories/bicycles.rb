FactoryBot.define do
  factory :bicycle do
    brand {Faker::App.name}
    name {Faker::Artist.unique.name}
    location {"Austin"}
    price_day {40}
    number_wheels {2}
    bicycle_type {%w(tandem regular monocycle tricycle elliptical).sample}
    foldable {false}
    user
  end
end


