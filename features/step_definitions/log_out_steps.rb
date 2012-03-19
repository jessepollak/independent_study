Then /^the page contains "([^']*)"$/ do |arg1|
  page.has_content? "Sign out"
end