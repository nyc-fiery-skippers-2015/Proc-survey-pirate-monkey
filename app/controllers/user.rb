get '/' do
  redirect '/login'
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/login' do
  erb :'users/login'
end

post '/users' do
  user = User.find_by(email: params[:user][:email])
  if user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/login"
  end
end

get '/users/:id' do
  current_user = User.find_by(id: params[:id])
  erb :'users/_show', locals: {user: current_user}
end

get '/users/:id/edit' do
  current_user = User.find_by(id: params[:id])
  erb :'/users/edit', locals: {user: current_user}
end

put '/users/:id' do
  current_user = User.find_by(id: params[:id])
  current_user.update(params[:user])
  return [500, 'invalid user'] unless current_user.save
  redirect "/users/#{current_user.id}"
end

post '/users/new' do
  new_user = User.new(params[:user])
  return [500, "invalid user"] unless new_user.save
  session[:user_id] = new_user.id
  redirect "/users/#{new_user.id}"
end

delete '/users/:id' do
  current_user = User.find_by(id: params[:id])
  return [500, "no user found"] unless current_user
  current_user.destroy
  redirect '/'
end

get '/users/:id/surveys/created' do

end

get '/users/:id/surveys/taken' do

end
