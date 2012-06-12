Given /^I come to the terminal$/ do
  @terminal = Terminal.new
end

Given /^I insert the card$/ do
  @terminal.output.should == "INIT"
  @terminal.accept "INSERT"
end

Given /^I enter pin (\d+)$/ do |pin|
  @terminal.output.should == "WAIT_PIN"
  @terminal.accept pin
end

When /^I type "(.*?)"$/ do |str|
  @terminal.accept str  
end


Then /^terminal state is "(.*?)"$/ do |str|
  @terminal.state.value.should == str
end



When /^I ask for balance$/ do
  @terminal.output.should == "MENU"
  @terminal.accept "BALANCE" 
end

Then /^the balance is (\d+) credits$/ do | sum |
  @terminal.state.value.should == "BALANCE"
  @terminal.output.should == sum.to_i
end

When /^I ask for (\d+) credits$/ do | sum |
  @terminal.output.should == "MENU"
  @terminal.accept sum.to_i
end

Then /^I get cash$/ do 
  @terminal.state.value.should == "CASH"
  @terminal.output.should == "CASH"
end

When /^I get one dollar and return to menu (\d+) times$/ do |many|
  many.to_i.times do
    @terminal.accept 1
    @terminal.accept "BACK"
  end
end

When /^I return back$/ do
  @terminal.accept "BACK"
  @terminal.state.value.should == "MENU"
  @terminal.output.should == "MENU"
end

When /^I exit the terminal$/ do
  @terminal.state.value.should == "MENU"
  @terminal.accept "EXIT"
end

Then /^commands counter is (\d+)$/ do |count|
  @terminal.instance_variable_get(("@" + "total_commands_counter").intern).should == count.to_i
end

Then /^I got the card back$/ do
  @terminal.state.value.should == "BYE"
end

Then /^I see message "(.*?)"$/ do | message_text |
  @terminal.output.should  =~ /#{message_text}/
end