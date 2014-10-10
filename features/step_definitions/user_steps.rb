Given(/^I am on the signup page$/) do
  visit('/users/sign_up')
end

When(/^I enter valid signup creditials$/) do
  submit_form('Sign up',
              email: 'test@test.com',
              password: 'p@ssw0rd',
              confirmation_password: 'p@ssw0rd')
end

Then(/^I am on the signup confirmation page$/) do
  expect(page).to have_content('Thank you for signing up')
end

When(/^I enter bad email creditials$/) do
  submit_form('Sign up',
              email: 'com.%214test@th$ahah.a',
              password: 'p@ssw0rd',
              confirmation_password: 'p@ssw0rd')
end

Then(/^I should see an email signup error$/) do
  expect(page).to have_content('the email is invalid, try again')
end

When(/^I enter bad password creditials$/) do
  submit_form('Sign up',
              email: 'test@test.com',
              password: 'p@sdagewjgo',
              confirmation_password: 'adoadfjoh')
end

Then(/^I should see a password signup error$/) do
  expect(page).to have('the password is invalid, try again')
end
