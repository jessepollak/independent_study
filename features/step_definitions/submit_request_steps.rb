Given /^I am a logged in user$/ do
  visit "/auth/facebook"
end

Given /^I am on the new request page$/ do
  visit new_request_url
end

Then /^I am taken to the show page for that request$/ do
  response.should have_selector('.request_title'), content: @title
end

Then /^I am returned to the form$/ do
  response.should have_selector('title', content: 'New Request')
end
