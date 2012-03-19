require 'date'

Given /^there are no pending requests$/ do
  @requests.should be_nil
end

Then /^a flash message displays "([^']*)"$/ do |arg1|
  page.should have_selector("#flash", :content => arg1)
end

Then /^the page displays "([^']*)"$/ do |arg1|
  page.should have_selector("#msg", :content => arg1)
end

Given /^there are one or more pending requests$/ do
  r1 = Request.create!(:title => "Bicycle", :date => (DateTime.now+5), :description => "Give me your bike!")
  r2 = Request.create!(:title => "Frisbee", :date => (DateTime.now+8), :description => "Wanna Frisbee")
  @requests = [r1, r2]
end

Then /^I am displayed a list of all the current requests$/ do
  page.should have_selector(".request", :content => [@requests[0].title, @requests[0].description, @requests[0].date, @requests[1].title, @requests[1].description, @requests[1].date])
end

Given /^the show page of a request$/ do
  @request = Request.create!(:title => "Bicycle", :date => (DateTime.now + 5), :description => "Give me your bike!")
  visit request_path(@request)
end

When /^the message sends successfully$/ do
  #pending 
end

Then /^a message with my information is sent to the user who posted the request$/ do
 # pending # express the regexp above with the code you wish you had
end

When /^the message does not send successfully$/ do
  #pending # express the regexp above with the code you wish you had
end

When /^I do not select a request$/ do
  pending
end

Then /^I am on the requests page$/ do
  page.should have_selector("title", :content => "Pending Requests")
end

When /^I select a request$/ do
  click_link request_path(@request)
end

Then /^I am returned to the show page of the request$/ do
  page.should have_selector("title", :content => @request.title)
end

Then /^I see the info posted by the user who made the request$/ do
  page.should contain(@request.description, @request.title, @request.date)
end
