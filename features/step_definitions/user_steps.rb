SIGNIN_CREDENTIALS = {
  valid: { user_email: 'test@test.com', user_password: 'p@ssw0rd' },
  invalid: { user_email: 'afaf32h@eqoge.cod', user_password: 'fjeoqfadhf' }
}

SIGNUP_CREDENTIALS = {
  valid: { user_email: 'test@test.com',
           user_password: 'p@ssw0rd',
           user_password_confirmation: 'p@ssw0rd' },
  bad_email: { user_email: 'com.%214test@th$ahah.a',
               user_password: 'p@ssw0rd',
               user_password_confirmation: 'p@ssw0rd' },
  bad_password: { user_email: 'test@test.com',
                  user_password: 'p@sdagewjgo',
                  user_password_confirmation: 'adoadfjoh' },
  existing_user: { user_email: 'existing@test.com',
                   user_password: 'p@ssw0rd',
                   user_password_confirmation: 'p@ssw0rd' }
}

def reset_password_button_value
  'reset my password'
end

Given(/^I am on the signup page$/) do
  visit('/users/sign_up')
end

When(/^I enter valid signup credentials$/) do
  submit_form('sign up', SIGNUP_CREDENTIALS[:valid])
end

Then(/^I should be on the signup confirmation page$/) do
  expect(page).to have_content('Thank you for signing up')
end

When(/^I enter bad email signup credentials$/) do
  submit_form('Sign up', SIGNUP_CREDENTIALS[:bad_email])
end

Then(/^I should see an email signup error$/) do
  expect(page).to have_content('the email is invalid, try again')
end

When(/^I enter bad password signup credentials$/) do
  submit_form('Sign up', SIGNUP_CREDENTIALS[:bad_password])
end

Then(/^I should see a password signup error$/) do
  expect(page).to have_content('the password is invalid, try again')
end

Given(/^I am on the reset password page$/) do
  visit('/users/password/new')
end

When(/^I enter valid reset credentials$/) do
  submit_form(reset_password_button_value,
              user_email: 'test@test.com')
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

When(/^I enter invalid reset credentials$/) do
  submit(reset_password_button_value,
         email: 'not_a_real_user@test.com')
end

Then(/^I should see no username error$/) do
  expect(page).to have_content('that email is not registered')
end

When(/^I enter valid signin credentials$/) do
  submit_form('Sign in', SIGNIN_CREDENTIALS[:valid])
end

Then(/^I should be on the main page$/) do
  expect(page).to have_content('Welcome to OpenMooc')
end

Then(/^I should be signed in$/) do
  expect(page).to have_selector(:link_or_button, 'Sign out')
end

When(/^I enter invalid signin credentials$/) do
  submit_form('Sign in', SIGNIN_CREDENTIALS[:invalid])
end

Then(/^I should be on the signin page$/) do
  expect(page).to have_content('Sign in')
end

Then(/^I should see invalid username\/password error$/) do
  expect(page).to have_content('invalid username and password')
end

Then(/^I should see reset password link$/) do
  expect(page).to have_selector(:link_or_button, 'Forgot your password?')
end

When(/^I leave the site$/) do
  visit('www.google.com')
end

When(/^I visit the main page$/) do
  visit('')
end

When(/^I sign out$/) do
  submit_form('Sign out')
end

Then(/^I should not be signed in$/) do
  expect(page).to have_selector(:link_or_button, 'Sign in')
end

When(/^I enter existing email signup credentials$/) do
  submit_form('Sign up', SIGNUP_CREDENTIALS[:existing_user])
end

Then(/^I should see an existing user signup error$/) do
  expect(page).to have_content('Sorry, that username is taken.')
end
