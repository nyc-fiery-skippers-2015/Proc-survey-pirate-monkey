get '/users/new' do
  erb :'users/new'
end

get 'users/:id' do
  current_user = User.find_by(id: params[:id])
  erb :'users/show', locals: {user: current_user}
end

post '/users/new' do
  new_user = User.new(params[:user])
  return [500, "invalid user"] unless new_user.save
  session[:user_id] = new_user.id
  redirect "/users/#{new_user.id}"
end

get '/users/:id/surveys/created' do

end

get '/users/:id/surveys/taken' do

end
