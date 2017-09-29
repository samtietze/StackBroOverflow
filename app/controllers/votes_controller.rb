post '/answers/:answer_id/votes' do
  vote_value = params[:vote].to_i
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.find_or_initialize_by(voter: current_user, votable: @answer)
  @vote.value = vote_value
  @vote.save
  @answer.votes << @vote
  redirect "/questions/#{@answer.question_id}"
end
