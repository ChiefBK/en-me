FactoryBot.define do

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    display_name { Faker::Artist.unique.name }

    factory :user_with_email, class: User do
      email { Faker::Internet.unique.email }
    end

    factory :user_with_phone, class: User do
      before(:create) do |user, evaluator|
        evaluator.phones = create_list(:phone, 1, user: user)
      end
    end
  end

end