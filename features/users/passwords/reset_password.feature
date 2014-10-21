Feature: User Password Reset
  As a user, I want to be able to reset
  my password.

  Scenario: Reset comfirmed user password
    Given I am on the reset password page
    When I submit a registered email
    Then I should see reset confirmation

  Scenario: Link from signin page
    Given I am on the signin page
    When I click on reset password
    Then I should be on the reset password page

  Scenario: Reset without being a user
    Given I am on the reset password page
    When I submit a non user email
    Then I should see no email error

  @LoggedIn
  Scenario: Change my password
    Given I am on the change password page
    When I change my password
    Then I should see a change password confirmation

  Scenario: Change my password not logged in
    When I visit the change password page
    Then I should be the sign up page
    And I should see I need to sign up
