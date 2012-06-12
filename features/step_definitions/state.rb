Given /^I have a "(.*?)" state$/ do |name|
  @state = State.new(name)
end

When /^I type "(.*?)" command$/ do |text|
  @command = Command.new(text)
end

Then /^I got state "(.*?)"$/ do |name|
  @conversion = Conversion.new(@command,@state)
  @conversion.next_state.should =~ /#{name}/
end