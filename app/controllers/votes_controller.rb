post '/answers/:answer_id/votes' do
  vote_value = params[:vote].to_i
  @answer = Answer.find(params[:answer_id])
  @vote = Vote.new(voter_id: current_user.id, value: vote_value)
  @answer.votes << @vote
  redirect "#{@answer.question.id}"
end
