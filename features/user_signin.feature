Feature: User Signin
  As a user, I want to be able to signin, signout, and be
  remembered.

  Scenario: A user signs in
    Given I am on the signin page
    When I enter valid signin credentials
    Then I should be on the main page
    And I should be signed in

  Scenario: A user tries signing in with bad credentials
    Given I am on the signin page
    When I enter invalid signin credentials
    Then I should be on the signin page
    And I should see invalid username/password error
    And I should see reset password link

  Scenario: A user leaves the site
    Given I am on the signin page
    When I enter valid signin credentials
    And I leave the site
    And I visit the main page
    Then I should be on the main page
    And I should be signed in
