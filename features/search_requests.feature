Feature: Search Requests

  So that users can search requests
  As a user
  I can submit a search
  And be returned a page of relevant items
  
  @javascript
  Scenario: I submit a valid search and there are results
    Given there are one or more pending requests
  	Given I am on the home page
  	When I fill in "search" with "Bicycle"
    And I hit enter
  	Then an alert message displays "We found 1 matching request."
  	And there is at least one result

  @javascript
  Scenario: I submit a valid search and there are no results
    Given there are one or more pending requests
  	Given I am on the home page
  	When I fill in "search" with "ASFJOIJDSGPO"
    And I hit enter
  	Then an alert message displays "No matching requests found. Please try searching again."
  	And there are no results