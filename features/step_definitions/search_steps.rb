Then /^I am taken to the search results page$/ do
  page.should have_selector("title", "Search Results")
end

Then /^there is at least one result$/ do
  page.should have_selector(".request")
end

Then /^there are no results$/ do
  page.should_not have_selector(".request")
end