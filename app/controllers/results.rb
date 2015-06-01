get '/surveys/:id/results' do
  current_survey = Survey.find_by(id: params[:id])
  require_logged_in
  redirect '/login' unless current_survey.creator_id == session[:user_id]

  erb :'results/show', locals: {survey: current_survey}
end

get '/surveys/:id/takers' do
  require_logged_in
  redirect '/login' unless current_survey.creator_id == session[:user_id]
  current_survey = Survey.find_by(id: params[:id])
  erb :'results/takers', locals: {survey: current_survey}
end
