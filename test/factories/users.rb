# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :new_user do
    sequence(:email) { |n| Faker::Internet.email }
    sequence(:password) { |n| Faker::Internet.password(12) }
  end
end
