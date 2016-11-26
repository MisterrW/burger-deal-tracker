require('pry-byebug')
require('minitest/autorun')
require('minitest/pride')
require_relative('models/eatery')
require_relative('models/burger')
require_relative('models/deal')
require_relative('db/seeds')





# Burger.delete_by_name("Gigaburger Grillfest")
# Eatery.delete_by_name("Le Grill de Gary")

binding.pry
nil