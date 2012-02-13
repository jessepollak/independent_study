Feature: Display all requests

So that I can browse the current requests
As a lender
I want to be displayed a list of all the pending requests

Scenario: There are no requests
	Given no pending requests
	When I visit the home page
	Then a flash message displays "There are currently no requests"
	
Scenario: There are requests
	Given one or more pending requests
	When I visit the home page
	Then I am displayed a list of all the current requests