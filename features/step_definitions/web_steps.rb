# for filling in text fields
When /^I fill in "([^']*)" with "([^']*)"$/ do |arg1, arg2|
  fill_in arg1, arg2
end

#for selecting from a list of options
When /^I select "([^']*)" for the "([^']*)"$/ do |arg1, arg2|
  select arg1
end

#for filling in a date field
When /^I give "([^']*)" for the date$/ do |arg1, arg2|
  select_date arg1, from: arg2
end

#for submitting forms or hitting buttons
When /^I click the "([^']*)" button$/ do |arg1|
  click_button arg1
end
