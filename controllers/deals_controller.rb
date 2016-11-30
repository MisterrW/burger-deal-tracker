
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
  burger_ids = params['burger']
  for_deal = params
  for_deal.delete('burger')

  new_deal = Deal.new( for_deal )
  new_deal.save

  if burger_ids
    burger_ids.each do |burger_id|
      burger_deal = BurgersDeals.new({
        'burger_id' => burger_id,
        'deal_id' => new_deal.id,
        'eatery_id' => new_deal.eatery_id
        })
      burger_deal.save
    end
  end
  redirect to '/deals'
end

get '/deal/delete' do
  @deals = Deal.all
  @eateries = Eatery.all
  erb(:delete_deal)
end

get '/deal/delete/confirm/:id' do
  @id = params[:id]
  @deal = Deal.get_by_id(@id)
  erb(:delete_deal_confirm)
end

post '/deal/deleted' do
  @id = params[:id]
  Deal.delete_by_id!(@id)
  redirect to '/deals'
end

get '/deal/update' do
  @deals = Deal.all
  @eateries = Eatery.all
  erb(:update_deal)
end

get '/deal/update/:id' do
  @deal = Deal.get_by_id(params[:id])
  @eateries = Eatery.all
  erb(:delete_deal)
end

post '/deal/updated' do
  @deal = deal.new(params)
  @deal.update
end




