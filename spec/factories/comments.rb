FactoryBot.define do
  factory :comment do
    user { create(:user_with_email) }
    event { create(:event) }
    text { 'some comment text' }
  end
end