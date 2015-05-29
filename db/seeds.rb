ash = User.create(name: "Ash",email: 'ash@pokemon.com', password_hash: 'ketchum')
snake = User.create(name: "Big Boss",email: 'metalgear@hotmail.com', password_hash: 'ketchum')

survey = Survey.new(title: "Favorite Programming Language")

survey.creator = ash
survey.save

question = Question.new(text: 'how old are you?')
question.survey = survey
question.save

question2 = Question.new(text: 'are you hungry?')
question2.survey = survey
question2.save

answer2 = Answer.new(text: 'yes')
answer2.question = question2
answer2.save

answer3 = Answer.new(text: 'no')
answer3.question = question2
answer3.save

answer = Answer.new(text: 11)
answer.question = question
answer.save

answer1 = Answer.new(text: 23)
answer1.question = question
answer1.save

snake.surveys << survey
snake.save

snake.answers << answer2
snake.answers << answer
snake.save
