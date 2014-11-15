
def new_question_params
 { 'Question' => 'Why do we fall?',
   'Answer' => 'To learn to pick ourselves back up again.' }
end

def fill_in_blank_question_activity
  @activity ||= FactoryGirl.create(:activity_with_fill_in_the_blank_question)
end

Given(/^I am on a fill in the blank question page$/) do
  visit(page_path(fill_in_blank_question_activity))
end

When(/^I enter new fill in the blank question content$/) do
  enter_form(new_question_params)
end

When(/^I enter a correct answer submission$/) do
  enter_form({
    'Answer' => 'Test Answer'
  })
end

Then(/^I should see a new quiz page$/) do
  expect(page).to have_content(new_question_params['Question'])
end
