FactoryBot.define do
  factory :phone do
    user { create(:user_with_email) }
    is_primary { true }
    phone_number { Random.random_number.to_s[2...12] }
  end
end