Feature: As a user I would like for links to only be
  appropiate for when I am signed in and not

  @LoggedIn
  Scenario: If logged on about page, display search
    courses
    Given I am on the about page
    When I click "Enroll in a course"
    Then I should be on the courses page

  Scenario: normally display display sign up
    on about page
    Given I am on the about page
    When I click "Sign up to enroll in a course"
    Then I should be on the sign up page
