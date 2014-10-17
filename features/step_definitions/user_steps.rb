def unregistered_user
  @unregistered_user ||= build(:unregistered_user)
end

def registered_user
  @registered_user ||= create(:registered_user)
end

def signup_inputs(user)
  { Email: user.email,
    Password: user.password,
    'Password confirmation' => user.password }
end

def signin_inputs(user)
 { Email: user.email,
   Password: user.password }
end

def reset_password_button_value
  'Reset my password'
end

Given(/^I am on the signup page$/) do
  visit('/users/sign_up')
end

When(/^I enter valid signup credentials$/) do
  submit_form('Sign up', signup_inputs(unregistered_user))
end

Then(/^I should be on the signup confirmation page$/) do
  expect(page).to have_content('A message with a confirmation link has been sent to your email address')
end

When(/^I enter bad email signup credentials$/) do
  user = unregistered_user
  user.email = 'real%3&@bad$#@.com'
  submit_form('Sign up', signup_inputs(user))
end

Then(/^I should see an email signup error$/) do
  expect(page).to have_content('Email is invalid')
end

When(/^I enter bad password signup credentials$/) do
  user = unregistered_user
  user.password = '1234'
  submit_form('Sign up', signup_inputs(user))
end

Then(/^I should see a password signup error$/) do
  expect(page).to have_content('Password is too short')
end

Given(/^I am on the reset password page$/) do
  visit('/users/password/new')
end

Then(/^I should see reset confirmation$/) do
  expect(page).to have_content('You will receive a password reset email in a few minutes')
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

When(/^I enter valid signin credentials$/) do
  submit_form('Log in', signin_inputs(registered_user))
end

Then(/^I should be on the main page$/) do
  expect(page).to have_content('OpenMooc, a truly open University')
end

Then(/^I should be signed in$/) do
  expect(page).to have_selector(:link_or_button, 'Log out')
end

When(/^I enter invalid signin credentials$/) do
  submit_form('Log in', signin_inputs(unregistered_user))
end

Then(/^I should be on the signin page$/) do
  expect(page).to have_content('Log in')
end

Then(/^I should see invalid username\/password error$/) do
  expect(page).to have_content('Invalid email address or password')
end

Then(/^I should see reset password link$/) do
  expect(page).to have_selector(:link_or_button, 'Forgot your password?')
end

When(/^I leave the site$/) do
  visit('http://www.google.com')
end

When(/^I visit the main page$/) do
  visit('')
end

When(/^I sign out$/) do
  click_link('Log out')
end

Then(/^I should not be signed in$/) do
  expect(page).to have_selector(:link_or_button, 'Log in')
end

When(/^I enter existing email signup credentials$/) do
  submit_form('Sign up', signup_inputs(registered_user))
end

Then(/^I should see an existing user signup error$/) do
  expect(page).to have_content('Email has already been taken')
end

When(/^I submit a registered email$/) do
  submit_form(reset_password_button_value, Email: registered_user.email)
end

When(/^I submit a non user email$/) do
  submit_form(reset_password_button_value, Email: unregistered_user.email)
end

Then(/^I should see no email error$/) do
  expect(page).to have_content('Email not found')
end
