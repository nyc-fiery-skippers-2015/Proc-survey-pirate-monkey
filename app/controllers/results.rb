get '/surveys/:id/results' do
  current_survey = Survey.find_by(id: params[:id])
  erb :'results/show', locals: {survey: current_survey}
end

get 'surveys/:survey_id/:user_id' do
  current_survey = Survey.find_by(id: params[:survey_id])
  user = User.find_by(id: params[:user_id])
  erb :'results/users', locals: {survey: current_survey, user: user}
end

get '/surveys/:id/takers' do
  current_survey = Survey.find_by(id: params[:id])
  erb :'results/takers', locals: {survey: current_survey}
end
