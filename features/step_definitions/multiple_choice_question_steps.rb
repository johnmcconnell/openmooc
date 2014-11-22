
def question
  @question ||= FactoryGirl.create(:multiple_choice_question_with_answers)
end

def correct_answer
  'You might find that notion ironic'
end

def question_params

end

### GIVEN ###

Given(/^I am on a multiple choice question page$/) do
  visit(page_path(question.quiz_activity.page))
end

When(/^I enter a correct multiple choice answer submission$/) do
  click_on(correct_answer)
end

When(/^I enter new multiple choice question content$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see a multiple choice quiz page$/) do
  pending # express the regexp above with the code you wish you had
end
