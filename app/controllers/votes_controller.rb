post '/answers/:answer_id/votes' do
  vote_value = params[:vote].to_i
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.find_or_initialize_by(voter: current_user, votable: @answer)
  @vote.value = vote_value
  @vote.save
  @answer.votes << @vote

  if request.xhr?
    content_type = :json
    { value: @answer.vote_count }.to_json
  else
    redirect "/questions/#{@answer.question_id}"
  end
end

post '/questions/:question_id/votes' do
  vote_value = params[:vote].to_i
  @question = Question.find(params[:question_id])
  @vote = Vote.find_or_initialize_by(voter: current_user, votable: @question)
  @vote.value = vote_value
  @vote.save
  @question.votes << @vote

  if request.xhr?
    content_type = :json
    { value: @question.vote_count }.to_json
  else
    redirect "/questions/#{@question.id}"
  end

end


post '/questions/:question_id/comments/:id/votes' do
  vote_value = params[:vote].to_i
  @comment = Comment.find(params[:comment_id])
  @vote = Vote.find_or_initialize_by(voter: current_user, votable: @comment)
  @vote.value = vote_value
  @vote.save
  @comment.votes << @vote

  if request.xhr?
    content_type = :json
    { value: @answer.vote_count }.to_json
  else
    redirect "/questions/#{@comment.question_id}"
  end
end

post '/answers/:answer_id/comments/:id/votes' do
    vote_value = params[:vote].to_i
  @comment = Comment.find(params[:comment_id])
  @vote = Vote.find_or_initialize_by(voter: current_user, votable: @comment)
  @vote.value = vote_value
  @vote.save
  @comment.votes << @vote

  if request.xhr?
    content_type = :json
    { value: @answer.vote_count }.to_json
  else
    redirect "/answers/#{@comment.answer_id}"
  end
end

