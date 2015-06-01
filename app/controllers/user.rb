require 'pry'
get '/users/new' do
  erb :'auth/signup'
end

get '/users/:id' do
  owner
  require_logged_in
  current_user = User.find_by(id: params[:id])
  return [500, "No user with that id"] unless current_user
  erb :'users/show', locals: {user: current_user}
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

get '/users/:id/surveys/created' do
  owner
  require_logged_in
  user = User.find_by(id: params[:id])
  created_surveys = Survey.where(creator_id: user.id)
  erb :'surveys/index', locals: {surveys: created_surveys}
end

get '/users/:id/surveys/taken' do
  user = User.find_by(id: params[:id])
  owner
  require_logged_in
  taken_surveys = Survey.where(creator_id: user.answer_takers.first.answer.question.survey.creator_id)
  erb :'surveys/taken', locals: {surveys: taken_surveys}
end

def owner
  redirect '/login' unless session[:user_id] == currently_logged_in.id
end
