require_relative('models/deal')
require_relative('models/burgers_deals')
require_relative('models/days')
require_relative('models/burger')

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

get '/deal/new' do
  id = TempIdStore.retrieve
  @eatery = Eatery.get_by_id(id)
  @days = Day.all
  @burgers = []
  @noburgers = ""
  all_burgers = Burger.all
  all_burgers.each do |burger|
    if burger.eatery_id == id
      @burgers << burger
    end
  end
  if @burgers.length == 0
    @noburgers = "No burgers found for this eatery! You'd better add some later..."
  end

  erb(:new_deal)
end

post '/deal/confirm' do
  binding.pry
  joint = Eatery.new( params )
  joint.save
  redirect to '/deal/confirm'
end

get '/deal/confirm' do
  erb(:deal_added)
end