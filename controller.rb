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

