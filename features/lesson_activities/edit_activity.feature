Feature: As a user I would like to edit
  page content of a lesson activity.

  Scenario:
    Given I am on a lesson activity edit page
    And I enter new lesson activity content
    And I click "Update"
    Then I should see the lesson activity
