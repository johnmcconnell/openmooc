Feature: As a user I would like at add content pages
  to the lesson.

  Scenario:
    Given I am on an activity page
    When I click "Edit lesson"
    And I click "Add material"
    And I enter new lesson activity content
    And I click "Create lesson"
    And I click "Edit lesson"
    Then I should see one more lesson page
