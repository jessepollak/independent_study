Feature: Log out
  
  So that users can add requests
  As a signed in user
  I can logout
  And have my session information destroyed

  
  Scenario: I log out
  	Given I am a logged in user
  	And the page contains "Sign out"
  	When I visit "/session/destroy"
  	Then I am returned to the home page
  	And the page contains "Sign in"
