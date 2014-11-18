Feature: As a user I like to submit
  answers to a quiz.

  Scenario:
    Given I am on a fill in the blank question page
    When I enter a correct answer submission
    And I click "Submit answer"
    Then I should see "Great Job!"
    And I should be on the next page

  Scenario:
    Given I am on a fill in the blank question page
    When I enter a wrong answer submission
    And I click "Submit answer"
    Then I should see "Try again!"
    And I should be on the fill in the blank question page
