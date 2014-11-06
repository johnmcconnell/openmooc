def new_section
  @section ||= FactoryGirl.build(:new_section)
end

def section_params(section)
  { 'Name' => section.name }
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

