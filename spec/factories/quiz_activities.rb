# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_activity do
    question nil

    factory :quiz_activity_with_fill_in_blank_question do
      association :question, factory: :fill_in_blank_question_with_answers
    end
  end
end
