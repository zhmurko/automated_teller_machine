Feature: Terminal commands
  In order to check out some cash
  As a card holder
  I want to work with terminal

  Background:
	Given I come to the terminal
	And I insert the card
	And I enter pin 1234
	
	Scenario: check balance
	  When I ask for balance
	  Then the balance is 10000 credits

	Scenario: get money
	  When I ask for 100 credits
      Then I get cash
	  When I return back
	  And I ask for balance
	  Then the balance is 9900 credits
	
	Scenario: finish work
	  When I exit the terminal
	  Then I got the card back




 