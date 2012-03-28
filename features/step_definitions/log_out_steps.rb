Then /^the page contains "([^']*)"$/ do |arg1|
  page.has_content? arg1
end