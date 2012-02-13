Feature: Post a request
  
  So that users can add a request to the database
  As a user
  I can submit a request
  Have my request stored in the database and displayed in the index
  And be returned to the index page
  
    
  Scenario: I submit a valid request for a specific date
    Given I am a logged in user
    Given an item title named "Bicycle"
    Given a description "I really need to borrow a bicycle for next weekend"
    Given a duration of 1 hour
    Given a date of 'February 1st, 2012'
    When I submit the request
    Then I am taken to the show page for that request

    
  Scenario: I submit a blank title
    Given I am a logged in user
    Given an item title named ""
    Given a description "I really need to borrow a bicycle for next weekend"
    Given a duration of 1 hour
    Given a time frame of within 1 day
    When I submit the request
    Then I am returned to the form
    And a notice is displayed saying the title was blank
    
  Scenario: I submit a blank description
    Given I am a logged in user
    Given an item title named "Bicycle"
    Given a description ""
    Given a duration of 1 hour
    Given a time frame of within 1 day
    When I submit the request
    Then I am taken to the show page for that request