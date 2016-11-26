require('pry-byebug')
require('minitest/autorun')
require('minitest/pride')
require_relative('models/eatery')
require_relative('models/burger')
require_relative('models/deal')
require_relative('models/burgers_deals')
require_relative('db/seeds')

Seeds.setup

binding.pry
nil