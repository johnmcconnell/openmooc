# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :new_section, class: Section do
    name 'New Section'
  end
end
