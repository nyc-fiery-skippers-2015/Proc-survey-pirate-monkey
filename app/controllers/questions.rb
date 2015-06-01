put '/questions/:id/answers' do
  current_answer = Answer.find_by(id: params[:answer])
  return [500, 'something went wrong'] unless current_answer
  redirect '/surveys' if current_answer.takers.map(&:id).include?(session[:user_id])
  current_answer.takers << currently_logged_in
  return {}.to_json
end

