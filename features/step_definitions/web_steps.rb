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
	select "8", from: "request_date_4i"
	select "30", from: "request_date_5i"
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

When /^I submit a valid request$/ do
	When 'I fill in "Title" with "Bicycle"'
	When 'I fill in "Description" with "Give me your bike!"'
	When 'I give "22 Feb 2012 04:05:06+03:30" for the date'
	When 'I click the "Submit Request" button'
end

When /^I submit an invalid request$/ do
	When 'I fill in "Title" with ""'
	When 'I fill in "Description" with "Give me your bike!"'
	When 'I give "22 Feb 2012 04:05:06+03:30" for the date'
	When 'I click the "Submit Request" button'
end

Given /^I am on the home page$/ do
  visit root_url
end

Given /^I am a logged in user$/ do
	user = User.new_user_from_hash({
	:provider => 'facebook',
	:uid => '12345',
	:info => {
	    :nickname => 'fooman',
	    :email => 'test@example.com',
	    :name => 'Foo Bar',
	    :first_name => 'Foo',
	    :last_name => 'Bar',
	    :image => "www.testimage.com/image"
  }})
  user.save
  visit "/session/create"
end

Then /^a flash message is displayed$/ do
	page.has_selector? '.flash'
end

When /^I select a request$/ do
	click_link 'Show'
end