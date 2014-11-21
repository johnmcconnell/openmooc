When(/^I select fill in the blank question$/) do
  click_on('question-dropdown')
  within(:css, '.dropdown-menu') do
    click_on('Fill in the blank question')
  end
end


Then(/^I should be on the next page of the quiz activity$/) do
  pending
end
