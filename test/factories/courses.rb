# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    id 1
    title "MyString"
    subject "MyString"
    topic "MyString"
    content "MyText"
  end
end
