Feature: Log in and log out
  
  So that users can add requests
  As a user
  I can submit a request
  Have my request stored in the database and displayed in the index
  And be returned to the index page
  
  Scenario: I accept the Facebook authentication
  	Given I am on the home page
  	And I accept the Facebook authentication
  	When I click the "Sign in" link
  	Then I am returned to the home page
  	And a flash message displays "You have successfully signed in!"

  Scenario: I deny the Facebook authentication
  	Given I am on the home page
  	And I do not accept the Facebook authentication
  	When I click the "Sign in" link
  	Then the page contains "Something went wrong with your Facebook authentication. Please return to the home page and try again."