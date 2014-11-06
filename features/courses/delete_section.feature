Feature: As a user I would like to add
  sections to a course

  Scenario:
    Given I am on the edit sections page
    When I click "Add section"
    And I enter new section information
    And I click "Update Course"
    And I click "Delete"
    Then I should not see a new section on the course page
