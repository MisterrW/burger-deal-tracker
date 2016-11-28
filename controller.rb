require('sinatra')
require('sinatra/contrib/all')
require_relative('deals_controller')
require_relative('burger_controller')
require_relative('eatery_controller')
require_relative('models/eatery')

get '/new/index' do
  @eateries = Eatery.all
  # binding.pry
  erb(:new_selector)
end

post '/deal_or_burger' do
  @id = params[:eatery_id].to_i

  eatery = Eatery.get_by_id(params[:eatery_id])
  # binding.pry
  if params["deal_or_burger"] == "deal"
    binding.pry
    redirect to '/eateries/new_deal/#{eatery.id.to_s}'
  elsif params["deal_or_burger"] == "burger"
    redirect to '/eateries/new_burger/#{eatery.id}'
  end
  binding.pry
end

# get '/eateries/new_deal do
#   "hello"
# end

# get '/eateries/new_burger/'' do
#   "thererc"
# end