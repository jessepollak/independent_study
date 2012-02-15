Given /^no pending requests$/ do
  Request.find(:all).should be_nil
end

When /^I visit the home page$/ do
  visit requests_path
end

Then /^a flash message displays "([^']*)"$/ do |arg1|
  response.should have_selector(".flash", :content => arg1)
end

Given /^one or more pending requests$/ do
  visit requests_path
  @request1 = Request.create!(:title => "Bicycle", :date => Time.now + 5.days, :description => "Give me your bike!", :posted_by => "Harry Potter")
  @request2 = Request.create!(:title => "Frisbee", :date => Time.now + 8.days, :description => "Wanna Frisbee", :posted_by => "Herman Cain")
end

Then /^I am displayed a list of all the current requests$/ do
  response.should contain(@request1.description, @request1.title, @request1.date, @request1.posted_by, @request2.title, @request2.date, @request2.description, @request2.posted_by)
end

Given /^the show page of a request$/ do
  @request1 = Request.create!(:title => "Bicycle", :date => Time.now + 5.days, :description => "Give me your bike!", :posted_by => "Harry Potter")
  visit request_path(@request1)
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

When /^I submit a form with invalid information$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I do not select a request$/ do
  pending
end

Then /^nothing happens$/ do
  response.should have_selector("title", :content => "Pending Requests")
end

When /^I select a request$/ do
  click_link request_path(@request)
end

Then /^I am returned to show page of the request$/ do
  response.should have_selector("title", :content => @request1.title)
end

Then /^I see the info posted by the user who made the request$/ do
  response.should contain(@request1.description, @request1.title, @request1.date, @request1.posted_by)
end
