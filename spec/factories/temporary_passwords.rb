FactoryBot.define do
  factory :temporary_password do
    user { create(:user) }
    password { Faker::Number.leading_zero_number(digits: 6) }
  end
end