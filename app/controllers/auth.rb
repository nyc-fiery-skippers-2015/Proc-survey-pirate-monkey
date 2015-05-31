get '/login' do
  erb :'users/login'
end

post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user.authenticate(params[:user][:password_hash])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect "/login"
  end
end

get '/logout' do

end

get '/signup' do

end
