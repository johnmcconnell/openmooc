# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course do
    sequence :id
    title "Test Title"
    subject "Test Subject"
    topic "Test Topic"
    description "Test Description"

    factory :new_course do
      title "New Title"
      subject "New Subject"
      topic "New Topic"
      description "New Description"
    end
  end
end
