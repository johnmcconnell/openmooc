Feature: As a user I like to submit
  answers to a quiz.

  Scenario:
    Given I am on a fill in the blank question page
    When I enter a correct answer submission
    And I click "Submit answer"
    Then I should see "Great Job!"
