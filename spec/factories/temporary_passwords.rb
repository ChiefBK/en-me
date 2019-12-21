FactoryBot.define do
  factory :temporary_password do
    user { create(:user_with_email) }
    password { Faker::Number.leading_zero_number(digits: 6) }

    trait :user_with_phone_number do
      user { create(:user_with_phone) }
    end
  end
end