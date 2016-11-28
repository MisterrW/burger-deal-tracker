require_relative('models/deal')
require_relative('models/burgers_deals')
require_relative('models/days')

get '/' do
  redirect to ('/deals')
end

get '/deals' do
  @deals = BurgersDeals.all_by_eatery_and_deal
 
  erb(:deals)
end

get '/days/:day_id' do
  deals = BurgersDeals.all_by_deal

  deals.each do |key, value|
    if key == params[:day_id].to_i
      @deals_today = value
    end
  end
  days = Day.all

  days.each do |day|
    if day.id == params[:day_id].to_i
      @day = day
    end
  end
  
  erb(:deals_today)
end

get '/deals/new' do

  erb(:new_deal)
end