get '/questions/:id/answers' do
  current_question = Question.find_by(id: params[:id])
  erb :'answers/show', locals: {question: current_question}
end


post '/questions/:id/answers' do
  new_answer = Answer.new(text: params[:text])
  current_question = Question.find_by(id: params[:id])
  new_answer.question = current_question
  # this has to changed into ajax
  return [500, "This Question is Not Valid"] unless new_answer.save
  # redirect "/questions/#{current_question.id}/answers"
end

