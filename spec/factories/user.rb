FactoryGirl.define do
  factory :user do
    first_name { FFaker::Name.first_name }
    last_name  { FFaker::Name.last_name }
    email      { FFaker::Internet.email }
    password   { SecureRandom.hex(15) }

    trait :admin do
      after :create do |user, evaluator|
        user.roles << Role.where(name: "administrator")
      end
    end
  end
end
