put '/questions/:id/answers' do
  current_answer = Answer.find_by(id: params[:answer])
  return [500, 'something went wrong'] unless current_answer

  # Refactor this line so that it works by doing the following
  # redirect '/surveys' if current_answer.takers.map(&:id).include?(session[:user_id])
  redirect '/surveys' if current_answer.survey.taken_by(current_user) # This is a cleaner implementation
  #.takers << currently_logged_in
  { redirect_to: "somewhere" }
  # return {}.to_json
end

