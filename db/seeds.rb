# seed file placeholder so github doesn't delete it. I don't know how this works.
require 'faker'
1.times do
  user = { username: 'BroMaGeddon', email: 'BroUp123@email.com', password: "test123" }

  new_user = User.create(user)
end

1.times do
  user = { username: 'BroStar', email: 'BroStar123@email.com', password: "test123" }

  new_user = User.create(user)
end

1.times do
  user = { username: 'BroTastic', email: 'BroTastic123@email.com', password: "test123" }

  new_user = User.create(user)
end

1.times do
  user = { username: 'BroMar400', email: 'BroMar123@email.com', password: "test123" }

  new_user = User.create(user)
end

1.times do
  user = { username: 'KingBro', email: 'KingBro123@email.com', password: "test123" }

  new_user = User.create(user)
end


1.times do
  question = { question_author_id: 1, subject: "Why is the sky blue?", question_body: "I was staring directly into the sun today, and noticed, the sky for the first time. Why is it blue? Any insight would be great thanks BRAHS!"}

  new_question = Question.create(question)
end

1.times do
  question = { question_author_id: 2, subject: "Why do the dumbells at my gym only goto 100 lbs?? URGENT!", question_body: "I was at my gym today (i mean yeah), I have become increasingly frustrated with weights only getting up to 100 pounds? Why is this? Need to get swoll."}

  new_question = Question.create(question)
end

1.times do
  question = { question_author_id: 3, subject: "Smashing Brews With the boys", question_body: "Not even a real question. Just wanted to say SUP TO MY BOYS!!!! "}

  new_question = Question.create(question)

end

1.times do
  question = { question_author_id: 4, subject: "Smashing  EVEN MORE!!!!! Brews With the boys", question_body: "Just another statement, the bros and i smashed tons of beers this afternoon. LESSSS GOOO!!!! "}

  new_question = Question.create(question)

end

1.times do
  question = { question_author_id: 5, subject: "How does time work?", question_body:"If someone could shed some light onto how time works that would be great. I am at the gym and i stay for hours and hours. I go in when its light and i come out and its dark? Any insight?"}

  new_question = Question.create(question)
end

1.times do
  question = { question_author_id: 1, subject: "How does Day and Night work?", question_body:"Piggybacking onto my previous comment. How does it turn from night to day? and day to night??"}

  new_question = Question.create(question)
end

1.times do
  question = { question_author_id: 2, subject: "Football and Beer", question_body: "Why do football and beer go well together? My girl just doesnt get that SATURDAYS ARE FOR THE BOYS!"}

  new_question = Question.create(question)
end

1.times do
  question = { question_author_id: 3, subject: "Protein", question_body: "What is your favorite protein and why? Trying to get extra swoll for the winter ITS BULKING SEASON!"}

  new_question = Question.create(question)
end


1.times do
  question = { question_author_id: 4, subject: "Taking my shirt off", question_body: "Any one else having the same problem as me? After a good swoll sesh i cant not POP THE TOP OFF!"}

  new_question = Question.create(question)
  end

1.times do
  question = { question_author_id: 5, subject: "Surf Bros", question_body: "This one is for the west coast bros. Anyone catch any good waves recently?"}

  new_question = Question.create(question)
  end


1.times do
answer = { answer_body: "SICK POST BRO! LOVE SMASHING BEERS WITH THE BROS!", answer_author_id: 1, question_id: 3, best_answer: false }

new_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "This guy has it all figured out, Smashing beers! love it!", answer_author_id: 2, question_id: 3, best_answer: false }

new_answer = Answer.create(answer)

end


1.times do
answer = { answer_body: "SICK MAN! love smashing brews!! ", answer_author_id: 3, question_id: 4, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Bruh that is the sickest thing ever. I am meeting up with the boys later to do the same thing!", answer_author_id: 1, question_id: 4, best_answer: false }

create_answer = Answer.create(answer)

end


1.times do
answer = { answer_body: "I mean it just is blue. Somethings just dont have answers man. Dont try and climb up and see why its blue. My boy tried to touch the sky and fell off a tree.", answer_author_id: 2, question_id: 1, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Dude it just is. Dont ask questions.", answer_author_id: 2, question_id: 1, best_answer: false }

create_answer = Answer.create(answer)

end


1.times do
answer = { answer_body: "DUDE tell me about it. I was hoping to grab some 120 dumbells and mine only go up to 80. So i took all the weights off the rack and threw them down on the ground. Dont mess with me and my weights", answer_author_id: 5, question_id: 2, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "I pray for you man. At my gym down here in CALI! we got 150 dumbells. Send me your snapchat name ill send you a snap of me getting swoll as shit later on", answer_author_id: 2, question_id: 2, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Somethings just go together man, Protein and lifting, Eggs and Eggs, Bro and Beers. Somethings just ARE!", answer_author_id: 1, question_id: 7, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "BRO i was thinking this same exact thing. I can smash like 100 beers watching football, but when i watch a movie with my girl she hates when i do that, i dont get it?", answer_author_id: 3, question_id: 7, best_answer: false }

create_answer = Answer.create(answer)

end


1.times do
answer = { answer_body: "Sometimes i see how much dry protein powder i can eat. Its awesome. Gets a laugh 60% of the time", answer_author_id: 4, question_id: 8, best_answer: false }

create_answer = Answer.create(answer)

end


1.times do
answer = { answer_body: "I heard that raw chicken has the more protein than cooked chicken can someone confirm this? I have been doing it for a few weeks starting to not feel so great", answer_author_id: 3, question_id: 8, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Time just works bro", answer_author_id: 4, question_id: 5, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Time just works, Like it just knows how to go a second", answer_author_id: 1, question_id: 5, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "You know how you get tired at night and want to sleep, the day does the same thing dude", answer_author_id: 4, question_id: 6, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Time just works, Like it just knows how to go a second", answer_author_id: 2, question_id: 6, best_answer: false }

create_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "BRO that is my worst nightmare", answer_author_id: 1, question_id: 2, best_answer: false }

new_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Do not even get me started about all the weaklings at my gym", answer_author_id: 5, question_id: 2, best_answer: false }

new_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "What he said. Cant even think about those things", answer_author_id: 5, question_id: 1, best_answer: false }

new_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Dont get bogged down in details on how things work", answer_author_id: 2, question_id: 1, best_answer: false }

new_answer = Answer.create(answer)

end
1.times do
answer = { answer_body: "Pop that tank off man! You work hard show it off!", answer_author_id: 3, question_id: 9, best_answer: false }

new_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "No Shirt, no service. YEAH OK! Ill go in there anyway. Try and stop me", answer_author_id: 1, question_id: 9, best_answer: false }

new_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "Raw chicken and raw eggs is literally my favorite meal. Yeah youll get sick sometimes but dude the protein!", answer_author_id: 3, question_id: 10, best_answer: false }
new_answer = Answer.create(answer)

end

1.times do
answer = { answer_body: "I would stop doing that immediately. JUST KIDDING! i eat like 5-9 raw chicken breasts a day. I have literally never been healthier", answer_author_id: 2, question_id: 10, best_answer: false }
new_answer = Answer.create(answer)

end

