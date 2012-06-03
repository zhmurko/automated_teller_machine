Feature: new card issue
  In order to have available money
  As a card holder
  I want to check a new card

  Background: 
	Given a plastic card
	
  Scenario: check default values 
	When I verify default pin
	Then pin is 1234

	When I check the balance
	Then I see 10000
 
  Scenario: borrow money from bank
	When I take 100 from card
	Then I see 9900

  Scenario: borrow too much money from bank
	When I take 10000000 from card
	Then I see 10000
	