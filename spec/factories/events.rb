FactoryBot.define do
  factory :event do
    name { Faker::Lorem.word }
    starts_at { Faker::Date.between(from: Date.today, to: 3.months.from_now) }
  end
end