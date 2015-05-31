get '/survey/:id' do
  survey = Survey.find_by(id: params[:id])
  erb :"survey/show", locals: {survey: survey}
end

get '/surveys/new' do
  erb :'surveys/new'
end

post '/surveys'  do
  survey = Survey.new( params[:survey])
  survey.creator = currently_logged_in
  return [500, "Something went wrong"] unless survey.save
  redirect "/surveys/#{survey.id}/questions"
end

get '/surveys/:id/questions' do
  current_survey = Survey.find_by(id: params[:id])
  erb :'surveys/questions', locals:{survey: current_survey}
end

post '/surveys/:id/questions' do
  question = Question.new(params[:question])
  question.survey = Survey.find_by(id: params[:id])
  return [500, "Something went wrong"] unless question.save
  redirect "/questions/#{question.id}/answers"
end
