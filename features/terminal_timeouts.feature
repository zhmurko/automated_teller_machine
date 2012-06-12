Feature: Terminal timeouts check
  In order to get a cash from the terminal
  As an idiot
  I want to type commands slowly

  Scenario: block by long time between state changes
	Given I time travel to 40 seconds ago
	  And I come to the terminal
	 When I back to the present time
	  And I insert the card
	 Then terminal state is "BLOCK"
	  And I see message "STATE_LIMIT"
	
  Scenario: block by long session time
	Given I time travel to 2 minutes ago
	  And I come to the terminal
	 When I wait for 29 second
	  And I insert the card
	  And I wait for 29 second
	  And I enter pin 1234
	  And I wait for 29 second
	  And I ask for balance
	  And I wait for 29 second
	  And I return back
	  And I wait for 29 second
	  And I ask for balance
	  And I wait for 29 second
	  And I type "BACK"
	 Then terminal state is "BLOCK"
	  And I see message "SESSION_TIMEOUT"

	