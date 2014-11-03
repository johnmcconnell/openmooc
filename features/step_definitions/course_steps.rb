def course
  @course ||= FactoryGirl.create(:course)
end

def new_course
  @new_course ||= FactoryGirl.build(:new_course)
end

def course_to_params(course)
  course.slice(:title, :description, :subject, :topic)
  .inject({}) do |params, (key, value)|
    params.tap { |p| p[key.capitalize] = value }
  end
end

Given(/^I am on an edit course page$/) do
    visit(edit_course_path(course))
end

Given(/^I am on the courses page$/) do
    visit(courses_path)
end

When(/^I enter new course information$/) do
  enter_form(course_to_params(new_course))
end

Then(/^I should be on the courses page$/) do
  expect(current_path).to eq(courses_path)
end

Then(/^I should see the new course information$/) do
  expect(page).to have_content(new_course.title)
end
