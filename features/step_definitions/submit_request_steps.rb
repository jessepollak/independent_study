Given /^I am a logged in user$/ do
  visit_page "/auth/facebook"
end

Then /^I am taken to the show page for that request$/ do
  response.should have_selector('.request_title'), content: @title
end

Then /^I am returned to the form$/ do
  response.should have_selector('title', content: 'New Request')
end

Then /^a notice is displayed saying the title was blank$/ do
  request.should have_selector('.flash', content: "Please submit a valid title.")
end
