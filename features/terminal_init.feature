Feature: Terminal initial state
  In order to check out some cash
  As a card holder
  I want to start work with terminal

  Background:
	Given I come to the terminal

	Scenario: insert a card to the terminal
	  When I insert the card
	  Then I see message "WAIT_PIN"

	Scenario: enter a card's pin
	  When I insert the card
	  And I enter pin 1234
	  Then I see message "MENU"