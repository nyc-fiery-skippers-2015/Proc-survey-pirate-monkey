put '/questions/:id/answers' do
  current_answer = Answer.find_by(id: params[:answer])
  redirect '/surveys' if current_answer.taker_id.include?(session[:user_id])
  current_answer.takers << currently_logged_in
  return {}.to_json
end

