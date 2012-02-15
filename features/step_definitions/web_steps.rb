# for filling in text fields
When /^I fill in "([^']*)" with "([^']*)"$/ do |arg1, arg2|
  fill_in arg1, arg2
end

#for selecting from a list of options
When /^I select "([^']*)" for the "([^']*)"$/ do |arg1, arg2|
  select arg1
end

#for filling in a date field
When /^I give "([^']*)" for the date$/ do |arg1|
  select_date DateTime.parse(arg1), from: "Date"
end

#for submitting forms or hitting buttons
When /^I click the "([^']*)" button$/ do |arg1|
  click_button arg1
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