put '/questions/:id/answers' do
  current_answer = Answer.find_by(id: params[:answer])
  current_answer.taker = currently_logged_in
  redirect '/surveys'
end

