require('sinatra')
require('sinatra/contrib/all')
require_relative('deals_controller')
require_relative('burger_controller')
require_relative('eatery_controller')
require_relative('models/eatery')
require_relative('models/temp_id_store')

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