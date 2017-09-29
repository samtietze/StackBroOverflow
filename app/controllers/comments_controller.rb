

get '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])
  @comment = Comment.new
  erb :'comments/show'
end



post '/questions/:question_id/comments' do
  authenticate!
  @question = Question.find(params[:question_id])
  @comment = Comment.new(comment_body: params[:user_input], comment_author_id: current_user.id)
  @question.comments << @comment
  if @comment.persisted?
    redirect "/questions/#{@question.id}"
  else
    @errors = @comment.errors.full_messages
    erb :'comments/show'
  end
end
