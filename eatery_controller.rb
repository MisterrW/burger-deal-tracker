require_relative('models/eatery')

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
