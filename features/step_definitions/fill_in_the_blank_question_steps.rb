
def new_question_params
 { 'Question' => 'Why do we fall?',
   'Answer' => 'To learn to pick ourselves back up again.' }
end

def wrong_answer_params
  { 'Answer' => 'Wrong Answer' }
end

def right_answer_params
  { 'Answer' => 'Test Answer' }
end

def question
  @question ||= FactoryGirl.create(:fill_in_the_blank_question_with_answers)
end

Given(/^I am on a fill in the blank question page$/) do
  visit(page_path(question.quiz_activity.page))
end

When(/^I enter new fill in the blank question content$/) do
  enter_form(new_question_params)
end

When(/^I enter a correct answer submission for fill in the blank question$/) do
  enter_form(right_answer_params)
end

When(/^I enter a wrong answer submission for fill in the blank question$/) do
  enter_form(wrong_answer_params)
end

Then(/^I should see a new quiz page$/) do
  expect(page).to have_content(new_question_params['Question'])
end

Then(/^I should be on the fill in the blank question page$/) do
  expect(current_path).to eq(page_path(question.quiz_activity.page))
end
