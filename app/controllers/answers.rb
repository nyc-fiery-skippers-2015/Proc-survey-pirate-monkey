get 'questions/:id/answers' do
  erb :'answers/show'
end


post '/questions/:id/answers' do
  new_answer = Answer.new(text: params[:text])
  current_question = Question.find_by(id: params[:id])
  new_answer.question = current_question
  new_answer.user = currently_logged_in
  return [500, "This Question is Not Valid"] unless new_answer.save
  redirect "/questions/#{current_question.id}/answers"
end

