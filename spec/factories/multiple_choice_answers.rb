# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :multiple_choice_answer do
    multiple_choice_question
    correct false

    factory :incorrect_multiple_choice_answer do
      correct false
    end

    factory :correct_multiple_choice_answer do
      correct true
    end
  end
end
