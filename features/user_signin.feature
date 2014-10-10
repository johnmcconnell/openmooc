Feature: User Signin/Signout
  As a user, I want to be able to signin, signout, and be
  remembered.

  Scenario: A user signs in
    Given I am on the signin page
    When I enter valid creditials
    Then I am on the main page
    And I am signed in

  Scenario: A user tries signing in with bad creditials
    Given I am on the signin page
    When I enter a bad creditials
    Then I expect I am on the signin page
    And I see invalid username/password error
    And I see reset password link

  Scenario: A user leaves the site
    Given I am on the signin page
    When I enter valid creditials
    And I leave the site
    And I visit the main page
    Then I am on the main page
    And I am signed in
