  Scenario: A user signs out
    Given I am on the signin page
    When I enter valid creditials
    And I sign out
    Then I am on the main page
    And I am not signed in
