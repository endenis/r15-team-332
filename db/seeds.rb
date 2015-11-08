# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.delete_all
Answer.delete_all

question = Question.create(description: "Hey ho je suis une description")
question.answers << Answer.create(title: "Cheese U by the Baguette Band")
question.answers << correct_answer = Answer.create(title: "Hmm, I got it")
question.answers << Answer.create(body: "Hmm, I think it's a song releated with wine")
question.correct_answer_id = correct_answer.id

