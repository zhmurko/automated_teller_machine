Given /^I time travel to (.+)$/ do |period|
  Delorean.time_travel_to(period)
  puts Time.now
end

When /^I back to the present time$/ do 
  Delorean.back_to_the_present
  puts Time.now
end

When /^I wait for (\d+) second$/ do |second|
  Delorean.jump second.to_i
end