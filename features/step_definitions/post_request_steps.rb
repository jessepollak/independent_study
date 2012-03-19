Given /^I am on the new request page$/ do
  visit new_request_url
end

Then /^I am taken to the show page for that request$/ do
  page.has_content? "Bicycle"
end

Then /^I am returned to the form$/ do
  page.should have_selector('title', content: 'New Request')
end
