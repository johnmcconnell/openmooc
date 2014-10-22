Given(/^I am on the main page$/) do
  visit(root_path)
end

Then(/^I should be on the main page$/) do
  expect(current_path).to eq(root_path)
end
