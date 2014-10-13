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

def reset_password_button_value
  'Send me reset password instructions'
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
  expect(page).to have_content('the password is invalid, try again')
end

Given(/^I am on the reset password page$/) do
  visit('/users/password/new')
end

When(/^I enter valid reset creditials$/) do
  submit_form(reset_password_button_value,
              email: 'test@test.com')
end

Then(/^I should see reset confirmation$/) do
  expect(page).to have_content('instructions have been sent')
end

Given(/^I am on the signin page$/) do
  visit('/users/sign_in')
end

When(/^I click on reset password$/) do
  click_link('Forgot your password?')
end

Then(/^I should be on the reset password page$/) do
  expect(page).to have_content('Forgot your password?')
end

When(/^I enter invalid reset creditials$/) do
  submit(reset_password_button_value,
         email: 'not_a_real_user@test.com')
end

Then(/^I should see no username error$/) do
  expect(page).to have_content('that email is not registered')
end

When(/^I enter valid signin creditials$/) do
  submit_form('Sign in',
              email: 'test@test.com',
              password: 'p@ssw0rd')
end

Then(/^I am on the main page$/) do
  expect(page).to have_content('Welcome to OpenMooc')
end

Then(/^I am signed in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter invalid signin creditials$/) do
  submit_form('Sign in',
              email: 'not_real@test.com',
              password: 'aafd23ev')
end

Then(/^I expect I am on the signin page$/) do
  expect(page).to have_content('Sign in')
end

Then(/^I see invalid username\/password error$/) do
  expect(page).to have_content('invalid username and password')
end

Then(/^I see reset password link$/) do
  expect(page).to have_selector(:link_or_button, 'Forgot your password?')
end

When(/^I leave the site$/) do
  visit('www.google.com')
end

When(/^I visit the main page$/) do
  visit('/')
end

When(/^I sign out$/) do
  submit_form('Sign out')
end

Then(/^I am not signed in$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter valid signup creditials$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter bad email creditials$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter existing email creditials$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see an existing user signup error$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter bad password creditials$/) do
  pending # express the regexp above with the code you wish you had
end
