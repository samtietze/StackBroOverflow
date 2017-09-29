# seed file placeholder so github doesn't delete it. I don't know how this works.
require 'faker'
# 5.times do
#   user = { username: Faker::Witcher.character, email: Faker::Internet.safe_email, password: "test123" }

#   new_user = User.create(user)
# end


2.times do
  question = { question_author_id: 1, subject: Faker::Beer.name, question_body: Faker::Coffee.notes}

  new_question = Question.create(question)
end

2.times do
  question = { question_author_id: 2, subject: Faker::Beer.name, question_body: Faker::Coffee.notes}

  new_question = Question.create(question)

end

2.times do
  question = { question_author_id: 3, subject: Faker::Beer.name, question_body: Faker::Coffee.notes}

  new_question = Question.create(question)
end

2.times do
  question = { question_author_id: 4, subject: Faker::Beer.name, question_body: Faker::Coffee.notes}

  new_question = Question.create(question)
end

2.times do
  question = { question_author_id: 5, subject: Faker::Beer.name, question_body: Faker::Coffee.notes}

  new_question = Question.create(question)
  end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 1, question_id: 3, best_answer: false }

new_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 1, question_id: 4, best_answer: false }

create_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 2, question_id: 1, best_answer: false }

create_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 2, question_id: 2, best_answer: false }

create_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 3, question_id: 7, best_answer: false }

create_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 3, question_id: 8, best_answer: false }

create_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 4, question_id: 5, best_answer: false }

create_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 4, question_id: 6, best_answer: false }

create_answer = Answer.create(answer)
end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 5, question_id: 2, best_answer: false }

new_answer = Answer.create(answer)

end

2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 5, question_id: 1, best_answer: false }

new_answer = Answer.create(answer)

end

2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 4, question_id: 9, best_answer: false }

new_answer = Answer.create(answer)

end


2.times do
answer = { answer_body: Faker::Hacker.say_something_smart, answer_author_id: 3, question_id: 10, best_answer: false }
new_answer = Answer.create(answer)

end

