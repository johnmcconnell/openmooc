Feature: As a user I like to submit
  answers to a quiz.

  Scenario:
    Given I am on a multiple choice question page
    When I enter a correct multiple choice answer submission
    And I click "Submit answer"
    Then I should see "Great Job!"
