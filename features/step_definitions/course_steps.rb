Then(/^I should be on the courses page$/) do
  expect(current_path).to eq(courses_path)
end
