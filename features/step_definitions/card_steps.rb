Given /^a plastic card$/ do
  @card = Card.new
end

When /^I verify default pin$/ do
end

Then /^pin is (\d+)$/ do |pin|
  @card.pin.should == pin.to_i
end

When /^I check the balance$/ do
end

Then /^I see (\d+)$/ do |num|
  @card.balance.should == num.to_i
end

When /^I take (\d+) from card$/ do |sum|
  @card.reduce_balance(sum.to_i)
end