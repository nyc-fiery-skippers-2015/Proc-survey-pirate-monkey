put '/questions/:id/answers' do
  current_answer = Answer.find_by(id: params[:answer])
  current_answer.takers << currently_logged_in
  return {}.to_json
end

