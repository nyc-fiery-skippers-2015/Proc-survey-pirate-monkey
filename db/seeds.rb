ash = User.create(name: "Ash",email: 'ash@pokemon.com', password_hash: 'ketchum')
snake = User.create(name: "Big Boss",email: 'metalgear@hotmail.com', password_hash: 'ketchum')

survey = Survey.new(title: "Favorite Programming Language")
survey2 = Survey.new(title: "DBC Stuff")

survey.creator = ash
survey.save

survey2.creator = snake
survey2.save

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

question3 = Question.new(text: 'Favorite DBC Coach?')
question3.survey = survey2
question3.save

answer4 = Answer.new(text: 'Zack')
answer4.question = question3
answer4.save

answer5 = Answer.new(text: 'Chris')
answer5.question = question3
answer5.save

