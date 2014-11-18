# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fill_in_the_blank_answer do
    text 'Test Answer'
    fill_in_the_blank_question nil
  end
end
