Feature: Terminal errors check
  In order to find a bug in the terminal
  As a fraudster
  I want to send an incorrect data

  Background:
	Given I come to the terminal
	
	Scenario: enter an incorrect pin
	  When I insert the card
	  And I type "12"
	  Then I see message "BAD_PIN"
	  And terminal state is "WAIT_PIN"

	  When I type "44444"
	  Then I see message "BAD_PIN"
	  And terminal state is "WAIT_PIN"

	  When I type "0x55"
	  Then I see message "BAD_COMMAND"
	  And terminal state is "WAIT_PIN"

	  When I type "-34344"
	  Then I see message "BAD_COMMAND"
	  And terminal state is "WAIT_PIN"

	  When I type "25222224222622222282222282722222"
	  Then I see message "BAD_PIN"
	  And terminal state is "BLOCK"

	Scenario: enter an incorrect command
	  When I insert the card
	  And I type "1234"
	  Then terminal state is "MENU"

	  When I type "PIZZA"
	  Then I see message "BAD_COMMAND"
	  And terminal state is "MENU"
	
	  When I type "BEER"
	  Then I see message "BAD_COMMAND"
	  And terminal state is "MENU"

	  When I type "BALANCE"
	  And I type "BACK"
	  Then terminal state is "MENU"

	  When I type "100 gramme vodka"
	  Then I see message "BAD_COMMAND"
	  And terminal state is "MENU"
		
	  When I type "TEA"
	  Then I see message "BAD_COMMAND"
	  And terminal state is "MENU"
	
	  When I type "COFFEE"
	  Then I see message "BAD_COMMAND"
	  And terminal state is "BLOCK"
	
	Scenario: enter massive amount of commands
	  When I insert the card
	  Then commands counter is 1

	  When I type "12"
	  Then I see message "BAD_PIN"
	  And commands counter is 2
	  And terminal state is "WAIT_PIN"

	  When I type "1234"
	  Then I see message "MENU"
	  And commands counter is 3
	
	  When I type "ERRROR_COMMAND"
	  Then commands counter is 4
	
	  When I type "BALANCE"
	  Then commands counter is 5
	
	  When I type "BACK"
	  Then commands counter is 6
	
	  When I get one dollar and return to menu 46 times
	  Then terminal state is "MENU"
	  And commands counter is 98
	
	  When I get one dollar and return to menu 1 times
	  Then terminal state is "BLOCK"
	  And commands counter is 100
	  And I see message "COMMAND_LIMIT"
