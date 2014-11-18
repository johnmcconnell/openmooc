def section
  @section
end

def section_with_activities
  @section ||= FactoryGirl.create(:section_with_activities)
end

def section_with_course
  @section ||= FactoryGirl.create(:course_with_sections).sections.first
end

def new_section
  @section ||= FactoryGirl.build(:section)
end

def section_params(section)
  { 'Name' => section.name }
end

def easy_html_remove(text)
  text.gsub(%r{</?[^>]+?>}, '')
end

Given(/^I am on a course sections page$/) do
  visit(section_path(section_with_course))
end

When(/^I enter new section information$/) do
  enter_form(section_params(new_section))
end

Then(/^I should see a new section on the course page$/) do
  expect(page).to have_content(new_section.name)
end

Then(/^I should not see new section info$/) do
  expect(page).not_to have_content(new_section.name)
end

Then(/^I should see new content on the sections page$/) do
  page_content = easy_html_remove(section.pages.first.activity.page_content.to_s)
  expect(page).to have_content(page_content)
end

Then(/^I should see one more lesson page$/) do
  expect(page).to have_content('2 Lesson material')
end
