require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/deals_controller')
require_relative('controllers/burger_controller')
require_relative('controllers/eatery_controller')
require_relative('models/eatery')
require_relative('models/temp_id_store')
require_relative('models/deal')
require_relative('models/burgers_deals')
require_relative('models/days')
require_relative('models/burger')

get '/new/index' do
  @eateries = Eatery.all
  # binding.pry
  erb(:new_selector)
end

post '/deal_or_burger' do
  TempIdStore.save(params[:eatery_id].to_i)

  if params["deal_or_burger"] == "deal"
    # binding.pry
    redirect to '/deal/new'
  elsif params["deal_or_burger"] == "burger"
    redirect to '/burger/new'
  end
  binding.pry
end



get '/burger/new' do
end