require_relative('models/deal')
require_relative('models/burgers_deals')

get '/deals' do
  @deals = BurgersDeals.all_by_eatery_and_deal
  binding.pry
  erb(:deals)
end

get '/deals/:day' do
  @deals = BurgersDeals.all_by_eatery_and_deal


end