# for filling in text fields
When /^I fill in "([^']*)" with "([^']*)"$/ do |arg1, arg2|
  fill_in arg1, with: arg2
end

#for selecting from a list of options
When /^I select "([^']*)" for the "([^']*)"$/ do |arg1, arg2|
  select arg1
end

#for filling in a date field
When /^I give "([^']*)" for the date$/ do |arg1|
  select_date DateTime.parse(arg1), from: "Date"
end

When /^I give a valid date$/ do
	select "2012", from: "request_date_1i"
	select "September", from: "request_date_2i"
	select "25", from: "request_date_3i"
end

#for submitting forms or hitting buttons
When /^I click the "([^']*)" button$/ do |arg1|
  click_button arg1
end

When /^I click the "([^']*)" link$/ do |arg1|
  click_link arg1
end

When /^I visit "([^']*)"$/ do |link|
	visit link
end

When /^I submit a valid message$/ do
	find('.btn-success').click
	step 'I fill in "Name" with "Test name"'
	step 'I fill in "Email" with "test@example.com"'
	step 'I fill in "Message" with "This is a super cool test message."'
	step 'I click the "Send" button'
end

When /^I submit an invalid message$/ do
	find('.btn-success').click
	step 'I fill in "Name" with ""'
	step 'I fill in "Email" with "test@example.com"'
	step 'I fill in "Message" with "This is a super cool test message."'
	step 'I click the "Send" button'
end

Given /^I am on the home page$/ do
  visit root_path
end

Given /^I am a logged in user$/ do
	step 'I am on the home page'
    step 'I accept the Facebook authentication'
    step 'I click the "Sign in" link'
    step 'I am redirected to the new user page'
    step 'I fill in "user_number" with "2023745555"'
    step 'I select "Pomona" for the "College"'
    step 'I click the "Submit" button'
end

Then /^a flash message is displayed$/ do
	page.has_selector? '.flash'
end

Then /^an alert message displays "([^']*)"$/ do |arg1|
  page.should have_selector(".alert", :content => arg1)
end

When /^I select a request$/ do
	find('tr.request').click
end