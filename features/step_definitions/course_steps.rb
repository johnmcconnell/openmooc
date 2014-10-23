def course
  @course ||= FactoryGirl.create(:course)
end

def new_course
  @new_course ||= FactoryGirl.build(:new_course)
end

Given(/^I am on an edit course page$/) do
    visit(edit_course_path(course))
end

Given(/^I am on the courses page$/) do
    visit(courses_path)
end

When(/^I enter new course information$/) do
    enter_form(new_course)
end

Then(/^I should be on the courses page$/) do
  expect(current_path).to eq(courses_path)
end

Then(/^I should see the new course information$/) do
  new_course.each do |key, value|
    expect(page).to have(value)
  end
end
