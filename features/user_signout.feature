Feature: User Signout
  I want to be able to signout of the page
  Scenario: A user signs out
    Given I am on the signin page
    When I enter valid signin credentials
    And I sign out
    Then I should be on the main page
    And I should not be signed in
