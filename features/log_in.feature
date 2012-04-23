Feature: Log in
  
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

  Scenario: I do not have an account and accept the Facebook authentication and enter valid information
    Given I am on the home page
    And I accept the Facebook authentication
    When I click the "Sign in" link
    Then I am redirected to the new user page
    When I fill in "user_number" with "2023745555"
    And I select "Pomona" for the "College"
    And I click the "Submit" button
    Then I am returned to the home page
    And I am stored in the database

  Scenario: I do not have an account and accept the Facebook authentication and enter invalid number
    Given I am on the home page
    And I accept the Facebook authentication
    When I click the "Sign in" link
    Then I am redirected to the new user page
    When I fill in "user_number" with "202374555"
    And I select "Pomona" for the "College"
    And I click the "Submit" button
    Then I am redirected to the new user page
    And I am not stored in the database

  Scenario: I do not have an account and accept the Facebook authentication and enter invalid email
    Given I am on the home page
    And I accept the Facebook authentication
    When I click the "Sign in" link
    Then I am redirected to the new user page
    When I fill in "user_number" with "2023745555"
    When I fill in "Email" with "bademail"
    And I select "Pomona" for the "College"
    And I click the "Submit" button
    Then I am redirected to the new user page
    And I am not stored in the database
