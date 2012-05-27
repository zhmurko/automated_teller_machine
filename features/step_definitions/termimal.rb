Given /^I come to the terminal$/ do
  @terminal = Terminal.new
end

Given /^I insert the card$/ do
  @terminal.type_command("INSERT")
end

Given /^I enter pin (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I ask for balance$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^the result is (\d+) credits$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I ask for (\d+) credits$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then /^I withdraw (\d+) credits$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I exit the termimal$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I got the card back$/ do
  pending # express the regexp above with the code you wish you had
end