get '/questions/:id/answers' do
  require_logged_in
  current_question = Question.find_by(id: params[:id])
  redirect '/login' unless current_question.survey.creator_id == session[:user_id]
  erb :'answers/show', locals: {question: current_question}
end


post '/questions/:id/answers' do
  answer = Answer.new(text: params[:text])
  question = Question.find_by(id: params[:id])
  question.answers << answer
  # this has to changed into ajax
  return [500, "This Question is Not Valid"] unless new_answer.save
  redirect "/questions/#{current_question.id}/answers"
end

