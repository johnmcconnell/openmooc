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
