Feature: User Signup
  As a user, I want to be able to signup for the webservice.

  Scenario: Singup a good user
    Given I am on the signup page
    When I enter valid signup credentials
    Then I should be on the signup confirmation page

  Scenario: Signup a bad email user
    Given I am on the signup page
    When I enter bad email signup credentials
    Then I should see an email signup error

  Scenario: Signup an existing user email
    Given I am on the signup page
    When I enter existing email signup credentials
    Then I should see an existing user signup error

  Scenario: Signup a bad confirm password
    Given I am on the signup page
    When I enter bad password signup credentials
    Then I should see a password signup error
