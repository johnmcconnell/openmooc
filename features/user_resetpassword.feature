Feature: User Password Reset
  As a user, I want to be able to reset
  my password.

  Scenario: Enter good credentials
    Given I am on the reset password page
    When I enter valid reset credentials
    Then I should see reset confirmation

  Scenario: Link from signin page
    Given I am on the signin page
    When I click on reset password
    Then I should be on the reset password page

  Scenario: Enter bad credentials
    Given I am on the reset password page
    When I enter invalid reset credentials
    Then I should see no username error
