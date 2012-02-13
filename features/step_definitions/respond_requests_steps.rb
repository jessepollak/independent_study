Given /^no pending requests$/ do
  @requests.count.should == 0
end

When /^I visit the home page$/ do
  visit request_path
end

Then /^a flash message displays "([^']*)"$/ do |arg1|
  response.should have_selector(".flash", :content => arg1)
end

Given /^one or more pending requests$/ do
  @requests.count.should_not == 0
end

Then /^I am displayed a list of all the current requests$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^the show page of a request$/ do
  request = @requests[0]
  visit request_path request
end

When /^I submit a form with valid information$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the message sends successfully$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^a message with my information is sent to the user who posted the request$/ do
  pending # express the regexp above with the code you wish you had
end

When /^the message does not send successfully$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I am returned to the show page of the request$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I submit a form with invalid information$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I do not select a request$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^nothing happens$/ do
end

When /^I select a request$/ do
end

Then /^I am returned to show page of the request$/ do
end

Then /^I see the info posted by the user who made the request$/ do
  pending # express the regexp above with the code you wish you had
end
