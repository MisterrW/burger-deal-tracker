

get '/joint/new' do
  erb(:new_eatery)
end

post '/joint/confirm' do
  joint = Eatery.new( params )
  joint.save
  redirect to '/joint/confirm'
end

get '/joint/confirm' do
  erb(:joint_added)
end

get '/joint/delete' do
  @eateries=Eatery.all
  erb(:delete_eatery)
end

get '/joint/delete/confirm/:id' do
  @id = params[:id]
  @eatery=Eatery.get_by_id(@id)
  erb(:delete_eatery_confirm)
end

post '/joint/deleted' do
  @id = params[:id]
  Eatery.delete_by_id!(@id)
  redirect to '/deals'
end