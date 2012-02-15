Feature: Search Requests

  So that users can search requests
  As a user
  I can submit a search
  And be returned a page of relevant items
  
  Scenario: I submit a valid search and there are results
  	Given I am on the home page
  	When I fill in "search" with "Bicycle"
  	Then I am taken to the search results page
  	And there is at least one result

  Scenario: I submit a valid search and there are no results
  	Given I am on the home page
  	When I fill in "search" with "ASFJOIJDSGPO"
  	Then I am taken to the search results page
  	And there are no results