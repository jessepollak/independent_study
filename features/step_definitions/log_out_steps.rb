Then /^the page contains "([^']*)"$/ do |arg1|
  page.should contain(arg1)
end