# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson_activity_with_content, class: LessonActivity do
    association :page_content, factory: :page_content
    association :page
  end
end
