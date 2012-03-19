Feature: Post a request
  
  So that users can add a request to the database
  As a user
  I can submit a request
  Have my request stored in the database and displayed in the index
  And be returned to the index page
  
    
  Scenario: I submit a valid request for a specific date
    Given I am a logged in user
    And I am on the new request page
    When I fill in "Title" with "Bicycle"
    And I fill in "Description" with "I really need to borrow a bicycle for next weekend"
    And I give a valid date
    And I click the "Create Request" button
    Then I am taken to the show page for that request

    
  Scenario: I submit a blank title
    Given I am a logged in user
    And I am on the new request page
    When I fill in "Title" with ""
    And I fill in "Description" with "I really need to borrow a bicycle for next weekend"
    And I give a valid date
    And I click the "Create Request" button
    Then I am returned to the form
    And a flash message is displayed
    
  Scenario: I submit a blank description
    Given I am a logged in user
    And I am on the new request page
    When I fill in "Title" with "Bicycle"
    And I fill in "Description" with ""
    And I give a valid date
    And I click the "Create Request" button
    Then I am taken to the show page for that request