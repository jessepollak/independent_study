Given /^I am a logged in user$/ do
  pending # express the regexp above with the code you wish you had
end

Given /^an item title named "([^']*)"$/ do |arg1|
  @title = arg1
end

Given /^a description "([^']*)"$/ do |arg1|
  @description = arg1
end

Given /^a duration of (\d+) hour$/ do |arg1|
  @duration = arg1
end

Given /^a date of 'February (\d+)st, (\d+)'$/ do |arg1, arg2|
  @date = Date.parse("Febraury #{arg1}, #{arg2}")
end

When /^I submit the request$/ do
  visit new_request_path
  fill_in "Title", @title
  fill_in "Description", @description
  select "#{helper.pluralize(@duration, "hour")}"
  select_date @date, from: "Date"
  click_buttom "Submit request"
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
