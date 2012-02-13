Feature: Respond to a request

So that users can offer to lend items in response to requests
As a lender
I want to submit a form with my information and send a message with that information to the user who posted the request

Scenario: I enter valid info in every field and the message sends successfully
	Given the show page of a request
	When I submit a form with valid information
	And the message sends successfully
	Then a message with my information is sent to the user who posted the request
	
Scenario: I enter valid info in every field and the message does not send successfully
	Given the show page of a request
	When I submit a form with valid information
	And the message does not send successfully
	Then I am returned to the show page of the request
	And a flash message displays "Error sending message"

Scenario: I enter invalid info in one or more field
	Given the show page of a request
	When I submit a form with invalid information
	Then I am returned to the show page of the request
	And a flash message displays "Invalid information"