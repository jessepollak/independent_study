Feature: Post a request
  
  So that users can add a request to the database
  As a user
  I can submit a request
  Have my request stored in the database and displayed in the index
  And be returned to the index page
  
    
  Scenario: I submit a valid request for a specific date
    Given I am a logged in user
    When I fill in "title" with "Bicycle"
    And I fill in "Description" with "I really need to borrow a bicycle for next weekend"
    And I select "1 hour" for the "duration"
    And I give "February 1st, 2012" for the date
    And I click the "Submit request" button
    Then I am taken to the show page for that request

    
  Scenario: I submit a blank title
    Given I am a logged in user
    When I fill in "title" with ""
    And I fill in "Description" with "I really need to borrow a bicycle for next weekend"
    And I select "1 hour" for the "duration"
    And I give "February 1st, 2012" for the date
    And I click the "Submit request" button
    Then I am returned to the form
    And a notice is displayed saying the title was blank
    
  Scenario: I submit a blank description
    Given I am a logged in user
    When I fill in "title" with "Bicycle"
    And I fill in "Description" with ""
    And I select "1 hour" for the "duration"
    And I give "February 1st, 2012" for the date
    And I click the "Submit request" button
    Then I am taken to the show page for that request