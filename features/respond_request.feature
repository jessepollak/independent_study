Feature: Respond to a request

So that users can offer to lend items in response to requests
As a lender
I want to submit a form with my information and send a message with that information to the user who posted the request

@javascript
Scenario: I enter valid info in every field and the message sends successfully
	Given the show page of a request
	When I submit a valid message
	And the message sends successfully
	Then a message with my information is sent to the user who posted the request

@javascript
Scenario: I enter invalid info in one or more field
	Given the show page of a request
	When I submit an invalid message
	Then I am returned to the show page of the request
	And there is a form error