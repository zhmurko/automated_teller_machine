Feature: Terminal
  In order to become a bit richer 
  As a common user
  I want to get money from terminal
  
Scenario: most expected
Given I come to the terminal
And I insert the card
And I enter pin 1234
When I ask for balance
Then the result is 10000 credits
When I ask for 100 credits
Then I withdraw 100 credits
When I ask for balance
Then the result is 9900 credits
When I exit the termimal
Then I got the card back




  
