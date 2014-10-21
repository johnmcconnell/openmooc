def feedback_form
  { Subject: 'Feedback',
    Message: 'This is my feedback suggestion' }
end
Given(/^I am on the help page$/) do
  visit('/help')
end

When(/^I submit a feedback form$/) do
  submit_form('Send feedback', feedback_form)
end

Then(/^I should see a feedback confirmation$/) do
  expect(page).to have_content('message sent')
end

Then(/^I should see sign in required$/) do
  expect(page).to have_content('Sorry, but you must be logged in to submit feedback')
end
