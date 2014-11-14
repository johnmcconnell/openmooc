
def new_quiz_params
 { Question: 'Why do we fall?',
   Answer: 'To learn to pick ourselves back up again.' }
end

When(/^I enter new fill in the blank question content$/) do
  enter_form(new_quiz_params)
end

Then(/^I should see a new quiz page$/) do
  expect(page).to have_content(new_quiz_params[:Question])
end
