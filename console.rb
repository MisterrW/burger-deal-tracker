require('pry-byebug')
require('minitest/autorun')
require('minitest/pride')
require_relative('models/eatery.rb')
require_relative('models/burger.rb')
require_relative('models/deal.rb')



Deal.all_pretty
Deal.by_day(3)
nil

binding.pry
nil