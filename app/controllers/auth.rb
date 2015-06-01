get '/' do
  all_surveys = Survey.all # You usually want to limit your "all" type queries - this will have tons of data in the future when you are web-scale
  erb :'home', locals: {surveys: all_surveys}
end

get '/login' do
  if is_authenticated?
    redirect '/logout'
  end
  erb :'auth/login'
end

# This route should probably go on the users controller
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
