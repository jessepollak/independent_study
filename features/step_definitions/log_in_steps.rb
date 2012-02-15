Given /^I am on the home page$/ do
  visit root_url
end

Given /^I accept the Facebook authentication$/ do
end

Given /^I do not accept the Facebook authentication$/ do
  OmniAuth.config.mock_auth[:facebook] = :invalid_credentials
end

Then /^I am returned to the home page$/ do
  response.should have_selector(:title, "Pending Requests")
end