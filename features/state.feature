Feature: States of terminal flow
  In order to get right way
  As a terminal administrator
  I want to configure state flow of the terminal

Scenario: check correct states
	Given I have a "INIT" state
	When I type "INSERT" command
	Then I got state "WAIT_PIN"
	
	Given I have a "WAIT_PIN" state
	When I type "1234" command
	Then I got state "MENU"
	
	Given I have a "MENU" state
	When I type "BALANCE" command
	Then I got state "BALANCE"
	
	Given I have a "MENU" state
	When I type "1000000000" command
	Then I got state "CASH"
	
	Given I have a "BALANCE" state
	When I type "BACK" command
	Then I got state "MENU"
	
	Given I have a "CASH" state
	When I type "BACK" command
	Then I got state "MENU"

	Given I have a "MENU" state
	When I type "EXIT" command
	Then I got state "BYE"
	
	
	