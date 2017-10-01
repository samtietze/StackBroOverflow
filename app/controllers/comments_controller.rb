get '/questions/:question_id/comments/new' do
  authenticate!
  @question = Question.find(params[:question_id])
  @comment = Comment.new
  erb :'comments/new_question_comment'
end

post '/questions/:question_id/comments' do
  authenticate!
  if @question = Question.find(params[:question_id])
    @comment = Comment.new(comment_body: params[:user_input], comment_author_id: current_user.id)
    @question.comments << @comment
    redirect :"questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/new_question_comment'
  end
end

get '/questions/:question_id/comments/:id/edit' do

end

put '/questions/:question_id/comments/:id' do

end

delete '/questions/:question_id/comments/:id' do

end

get '/answers/:answer_id/comments/new' do
  authenticate!
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.new
  erb :'comments/new_answer_comment'
end

post '/answers/:answer_id/comments' do
  authenticate!
  if @answer = Answer.find(params[:answer_id])
    @comment = Comment.new(comment_body: params[:user_input], comment_author_id: current_user.id)
    @answer.comments << @comment
    redirect :"questions/#{@answer.question_id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/new_answer_comment'
  end
end

get '/answers/:answer_id/comments/:id/edit' do

end

put '/answers/:answer_id/comments/:id' do

end

delete '/answers/:answer_id/comments/:id' do

end
