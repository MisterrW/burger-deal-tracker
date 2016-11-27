require_relative('models/deal')
require_relative('models/burgers_deals')

get '/deals' do
  @deals = BurgersDeals.all_by_eatery_and_deal
 
  erb(:deals)
end

get '/days/:day' do
  deals = BurgersDeals.all_by_deal
  deals.each do |key, value|
    if key.downcase == params[:day]
      @deals_today = value
    end
  end
  
  
  erb(:deals_today)
end


