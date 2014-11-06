# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :section do
    name "MyString"
    course nil
    page_content ""
  end
end
