# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page do
    type ""
    section nil
    position 1

    factory :page_with_fill_in_the_blank_question do
      association :section, factory: :new_section

      association :page, factory: :quiz_activity_with_fill_in_blank_question
    end
  end
end
