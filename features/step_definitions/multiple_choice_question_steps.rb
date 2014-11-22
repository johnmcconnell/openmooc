
def mc_question
  @question ||= FactoryGirl.create(:multiple_choice_question_with_answers)
end

def correct_answer
  'correct answer'
end

def question_params

end

### GIVEN ###

Given(/^I am on a multiple choice question page$/) do
  visit(page_path(mc_question.quiz_activity.page))
end

When(/^I enter a correct multiple choice answer submission$/) do
  click_on(correct_answer)
end

When(/^I enter new multiple choice question content$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should be on the multiple choice quiz page$/) do
  expect(current_path).to eq(page_path(mc_question.quiz_activity.page))
end
