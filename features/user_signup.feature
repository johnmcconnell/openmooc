Feature: User Signup
  As a user, I want to be able to signup for the webservice.

  Scenario: Singup a good user
    Given I am on the signup page
    When I enter valid signup creditials
    Then I am on the signup confirmation page

  Scenario: Signup a bad email user
    Given I am on the signup page
    When I enter bad email creditials
    Then I should see an email signup error

  Scenario: Signup a bad confirm password
    Given I am on the signup page
    When I enter bad password creditials
    Then I should see a password signup error
