require_relative('models/deal')

get '/deals' do
  @deals = Deal.all_pretty
  erb(:deals)
end