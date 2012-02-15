Then /^the page contains "([^']*)"$/ do |arg1|
  response.should contain(arg1)
end