get '/surveys/new' do
  require_logged_in
  erb :'surveys/new'
end

get '/surveys/:id' do
  require_logged_in
  survey = Survey.find_by(id: params[:id])
  erb :"surveys/show", locals: {survey: survey}
end

get '/surveys' do
  surveys = Survey.all
  erb :'surveys/index', locals: {surveys: surveys}
end



post '/surveys'  do
  survey = Survey.new( params[:survey])
  survey.creator = currently_logged_in
  return [500, "Something went wrong"] unless survey.save
  redirect "/surveys/#{survey.id}/questions"
end

get '/surveys/:id/questions' do
  require_logged_in
  current_survey = Survey.find_by(id: params[:id])
  redirect '/login' unless current_survey.creator_id == session[:user_id]
  erb :'surveys/questions', locals:{survey: current_survey}
end

post '/surveys/:id/questions' do
  question = Question.new(params[:question])
  question.survey = Survey.find_by(id: params[:id])
  return [500, "Something went wrong"] unless question.save
  redirect "/questions/#{question.id}/answers"
end

delete '/surveys/:id' do
  current_survey = Survey.find_by(id: params[:id])
  return [500, 'Error'] unless current_survey
  current_survey.destroy
  redirect '/surveys'
end

put '/surveys/:id' do
  current_survey = Survey.find_by(id: params[:id])
  current_survey.closed = true
  redirect '/surveys'
end



