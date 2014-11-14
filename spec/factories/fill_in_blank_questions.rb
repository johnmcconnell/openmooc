# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :fill_in_blank_question do
    page_content PageContent.new
    answers []

    factory :fill_in_blank_question_with_answers do
      answers { create_list(:fill_in_blank_answer, 3) }
    end
  end
end
