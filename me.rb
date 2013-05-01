#!/usr/bin/env ruby

require File.join(File.dirname(__FILE__), 'lib', 'credit_card')

ARGF.each do |line|
  card = CreditCard.new line
  puts card.output
end