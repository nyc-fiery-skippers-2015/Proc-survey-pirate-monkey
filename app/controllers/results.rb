get '/surveys/:id/results' do
  current_survey = Survey.find_by(id: params[:id])
  erb :'results/show', locals: {survey: current_survey}
end

get '/surveys/:id/takers' do
  current_survey = Survey.find_by(id: params[:id])
  erb :'results/takers', locals: {survey: current_survey}
end
