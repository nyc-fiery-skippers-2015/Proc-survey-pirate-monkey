get '/users/:id' do
  return [500, "No user with that id"] unless current_user
  erb :'users/show', locals: {user: current_user}
end

get '/users/new' do

end

post '/users' do
  new_user = User.new(params[:user])
  return [500, "Invalid User"] unless new_user.save
  session[:user_id] = new_user.id
  redirect "/users/#{new_user.id}"
end

delete '/users' do
  return [500, "No User with that ID"] unless current_user
  current_user.destroy
  redirect '/login'
end
