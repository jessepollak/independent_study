Then /^I am taken to the search results page$/ do
  response.should have_selector(:title, "Search Results")
end

Then /^there is at least one result$/ do
  response.should have_selector(".request")
end

Then /^there are no results$/ do
  response.should_not have_selector(".request")
end