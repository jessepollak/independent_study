Feature: Log in and log out
  
  So that users can sign in
  As a user
  I can click the sign in button
  And either create an account
  Or log in
  
  Scenario: I have an account and accept the Facebook authentication
  	Given I am on the home page
  	And I accept the Facebook authentication
  	When I click the "Sign in" link
  	Then I am returned to the home page
  	And a flash message displays "You have successfully signed in!"

  Scenario: I do not have an account and accept the Facebook authentication
    Given I am on the home page
    And I accept the Facebook authentication
    When I click the "Sign in" link
    Then I am redirected to the new user page
    When I fill in "number" with "2023745555"
    And I select "Pomona" for the "College"
    And I click the "Submit" button
    Then I am returned to the home page
    And a flash message displays "You have successfully signed up!"

  Scenario: I deny the Facebook authentication
  	Given I am on the home page
  	And I do not accept the Facebook authentication
  	When I click the "Sign in" link
  	Then the page contains "Something went wrong with your Facebook authentication. Please return to the home page and try again."