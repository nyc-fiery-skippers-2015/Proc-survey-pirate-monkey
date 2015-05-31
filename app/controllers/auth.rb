get '/' do

end

get '/login' do
  if is_authenticated?
    redirect '/logout'
  end
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

get '/logout' do
  erb :'auth/logout'
end

post '/session' do
  user = User.find_by(email: params[:user][:email])
  return [500, "login error"] unless user
  if user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/login"
  end
end

delete '/session' do
  session[:user_id] = nil
  redirect "/login"
end
