# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :new_section, class: Section do
    name 'User Created Section Name'

    association :course, factory: :course

    factory :section_with_activities do
      activities { create_list(:activity, 3) }
    end
  end
end
