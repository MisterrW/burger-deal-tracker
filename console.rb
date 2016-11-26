require('pry-byebug')
require('minitest/autorun')
require('minitest/pride')
require_relative('models/eatery')
require_relative('models/burger')
require_relative('models/deal')
require_relative('models/burgers_deals')
require_relative('db/seeds')

Seeds.setup

all_combos = Deal.all_pretty
all_by_eatery = all_combos.group_by { |x| x['eatery']}
# all_by_deal = all_by_eatery.each do |x|
#   binding.pry
#   x.group_by { |y| y['deal']}
# end


all_by_deal = {}
all_by_eatery.each do |key,value|
  temp_thing = {key => value.group_by {|x| x['deal']}}
  # binding.pry
  all_by_deal.merge!(temp_thing)
end


binding.pry
nil