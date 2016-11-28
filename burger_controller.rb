get '/burger/new' do
  id = TempIdStore.retrieve
  @eatery = Eatery.get_by_id(id)
  @deals = []
  @nodeals = ""
  all_deals = Deal.all
  all_deals.each do |deal|
    if deal.eatery_id == id
      @deals << deal
    end
  end
  if @deals.length == 0
    @nodeals = "No deals found for this eatery! You'd better add some later..."
  end

  erb(:new_burger)
end

post '/burger/confirm' do
  deal_ids = params['deal']
  for_burger = params
  for_burger.delete('deal')

  new_burger = Burger.new( for_burger )
  new_burger.save

  if deal_ids
    deal_ids.each do |deal_id|
      burger_deal = BurgersDeals.new({
        'burger_id' => new_burger.id,
        'deal_id' => deal_id,
        'eatery_id' => new_burger.eatery_id
        })
      burger_deal.save
    end
  end

  redirect to '/deals'
end








