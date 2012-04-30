require 'date'

Given /^there are no pending requests$/ do
  @requests.should be_nil
end

Then /^the page displays "([^']*)"$/ do |arg1|
  page.should have_selector("#msg", :content => arg1)
end

Given /^there are one or more pending requests$/ do
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
  r1 = user.requests.create!(:title => "Bicycle", :date => (DateTime.now+5), :description => "Give me your bike!")
  r2 = user.requests.create!(:title => "Frisbee", :date => (DateTime.now+8), :description => "Wanna Frisbee")
  @requests = [r1, r2]
end

Then /^I am displayed a list of all the current requests$/ do
  page.should have_selector(".request", :content => [@requests[0].title, @requests[0].description, @requests[0].date, @requests[1].title, @requests[1].description, @requests[1].date])
end

Given /^the show page of a request$/ do
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
  @request = user.requests.create!(:title => "Bicycle", :date => (DateTime.now + 5), :description => "Give me your bike!")
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
end

Then /^I am on the requests page$/ do
  page.should have_selector("title", :content => "Pending Requests")
end

Then /^I am returned to the show page of the request$/ do
  page.should have_selector(".response-form")
end

Then /^there is a form error$/ do
  page.should have_selector(".errors")
end
