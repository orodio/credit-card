require 'credit_card'

Given(/^Credit card with number of (.*)$/) do |number|
  @card = CreditCard.new number
end

Then /^Credit card number is (.*)$/ do |number|
  assert_equal @card.number, number
end

Then /^Credit card type is (.*)$/ do |type|
  assert_equal @card.type, type
end

Then /^Credit card is valid\? (.*)$/ do |valid|
  card_valid = @card.valid? ? 'valid' : 'invalid'
  assert_equal card_valid, valid
end

Then /^Credit card output is (.*)$/ do |output|
  puts @card.output
  assert_equal @card.output, output
end