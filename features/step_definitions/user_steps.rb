def good_credentials
  { email: 'test@test.com', 
    password: 'p@ssw0rd',
    confirmation_password: 'p@ssw0rd' }
end

def bad_email_credentials
 { email: 'com.%214test@th$ahah.a',
   password: 'p@ssw0rd',
   confirmation_password: 'p@ssw0rd' }
end

Given(/^I am on the signup page$/) do
  visit('/users/sign_up')
end

When(/^I enter valid signup credentials$/) do
  submit_form('sign up', good_credentials)
end

Then(/^I am on the signup confirmation page$/) do
  expect(page).to have_content('Thank you for signing up')
end

When(/^I enter bad email credentials$/) do
  submit_form('Sign up', bad_email_credentials)
end

Then(/^I should see an email signup error$/) do
  expect(page).to have_content('the email is invalid, try again')
end

When(/^I enter bad password credentials$/) do
  submit_form('Sign up',
              email: 'test@test.com',
              password: 'p@sdagewjgo',
              confirmation_password: 'adoadfjoh')
end

Then(/^I should see a password signup error$/) do
  expect(page).to have('the password is invalid, try again')
end

Given(/^I am on the signin page$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I enter valid credentials$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I am on the main page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I am signed in$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I enter a bad credentials$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I expect I am on the signin page$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I see invalid username\/password error$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I see reset password link$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I leave the site$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I visit the main page$/) do
    pending # express the regexp above with the code you wish you had
end

When(/^I sign out$/) do
    pending # express the regexp above with the code you wish you had
end

Then(/^I am not signed in$/) do
    pending # express the regexp above with the code you wish you had
end
