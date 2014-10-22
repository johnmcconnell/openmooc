When(/^I click "(.*?)"$/) do |text|
  click_on(text)
end

Given(/^I am on the about page$/) do
  visit(about_path)
end
