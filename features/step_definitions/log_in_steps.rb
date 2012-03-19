

Given /^I accept the Facebook authentication$/ do
end

Then /^I am redirected to the new user page$/ do
	page.should have_selector('form', id: "new_user")
end

Given /^I do not accept the Facebook authentication$/ do
end

Then /^I am returned to the home page$/ do
  page.has_selector?('table#requests-table')
end

Then /^I am stored in the database$/ do
	User.count.should == 1
end

Then /^I am not stored in the database$/ do
	User.count.should == 0
end