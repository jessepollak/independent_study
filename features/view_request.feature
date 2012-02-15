Feature: View a request

So that users can view the details of a request
As a lender
I want to select a specific request and view more information about it

Scenario: I do not select a request
	Given the home page
	When there are one or more pending requests
	And I do not select a request
	Then I am on the requests page
	
Scenario: I select a request
	Given the home page
	When there are one or more pending requests
	And I select a request
	Then I am returned to the show page of the request
	And I see the info posted by the user who made the request
