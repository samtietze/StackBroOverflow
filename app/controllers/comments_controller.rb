get '/questions/:question_id/comments/new' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  @comment = Comment.new
  if @question
    if request.xhr?
      erb :'comments/new_question_comment', layout: false, locals: { comment: @comment, question: @question }
    else
      erb :'comments/new_question_comment'
    end
  else
    redirect :not_authorized
  end
end

post '/questions/:question_id/comments' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  @comment = Comment.new(comment_body: params[:user_input], comment_author_id: current_user.id)
    @question.comments << @comment
  if @comment.persisted?
    if request.xhr?
      erb :'comments/_question_comment_container', layout: false, locals: { question: @question, comment: @comment }
    else
      redirect :"questions/#{@question.id}"
    end
  else
    @errors = @comment.errors.full_messages
    if request.xhr?
      status 422
      erb :'comments/new_question_comment', layout: false, locals: { errors: @errors, comment: @comment, question: @question }
    else
      erb :'comments/new_question_comment'
    end
  end
end

get '/questions/:question_id/comments/:id/edit' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  @comment = Comment.find_by(id: params[:id])
  authorize!(@comment.comment_author)
  if request.xhr?
    erb :'comments/edit_question_comment', layout: false, locals: { comment: @comment, question: @question }
  else
    erb :'comments/edit_question_comment'
  end
end

put '/questions/:question_id/comments/:id' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  @comment = Comment.find_by(id: params[:id])
  authorize!(@comment.comment_author)
  @comment.update_attributes(comment_body: params[:user_input])
  if @comment.persisted?
    if request.xhr?
      erb :'comments/_question_comment_container', layout: false, locals: { question: @question, comment: @comment }
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @comment.errors.full_messages
    if request.xhr?
      status 422
      erb :'comments/edit_question_comment', layout: false, locals: { errors: @errors, question: @question, comment: @comment }
    else
      erb :'comments/edit_question_comment'
    end
  end
end

delete '/questions/:question_id/comments/:id' do
  authenticate!
  @question = Question.find_by(id: params[:question_id])
  # authorization overkill:
  @comment = Comment.find_by(id: params[:id], comment_author_id: current_user.id)
  authorize!(@comment.comment_author)
  @comment.destroy
  if request.xhr?
    # delete that shit?
  else
    redirect "/questions/#{@question.id}"
  end
end

get '/answers/:answer_id/comments/new' do
  authenticate!
  @answer = Answer.find(params[:answer_id])
  @comment = Comment.new
  if request.xhr?
    erb :'comments/new_answer_comment', layout: false, locals: { answer: @answer, comment: @comment }
  else
    erb :'comments/new_answer_comment'
  end
end

post '/answers/:answer_id/comments' do
  authenticate!
  @answer = Answer.find_by(id: params[:answer_id])
  @comment = Comment.new(comment_body: params[:user_input], comment_author_id: current_user.id)
  @answer.comments << @comment
  if @comment.persisted?
    if request.xhr?
      erb :'comments/_answer_comment_container', layout: false, locals: { answer: @answer, comment: @comment }
    else
      redirect :"questions/#{@answer.question_id}"
    end
  else
    status 422
    @errors = @comment.errors.full_messages
    if request.xhr?
      erb :'comments/new_answer_comment', layout: false, locals: { errors: @errors, answer: @answer, comment: @comment }
    else
      erb :'comments/new_answer_comment'
    end
  end
end

get '/answers/:answer_id/comments/:id/edit' do
  authenticate!
  @answer = Answer.find_by(id: params[:answer_id])
  @comment = Comment.find_by(id: params[:id])
  authorize!(@comment.comment_author)
  if request.xhr?
    erb :'comments/edit_answer_comment', layout: false, locals: { comment: @comment, answer: @answer }
  else
    erb :'comments/edit_answer_comment'
  end
end

put '/answers/:answer_id/comments/:id' do
  authenticate!
  @answer = Answer.find_by(id: params[:answer_id])
  @comment = Comment.find_by(id: params[:id])
  authorize!(@comment.comment_author)
  @comment.update_attributes(comment_body: params[:user_input])
  if @comment.persisted?
    if request.xhr?
      erb :'comments/_answer_comment_container', layout: false, locals: { answer: @answer, comment: @comment }
    else
      redirect "/questions/#{@answer.question_id}"
    end
  else
    @errors = @comment.errors.full_messages
    if request.xhr?
      status 422
      erb :'comments/edit_answer_comment', layout: false, locals: { errors: @errors, answer: @answer, comment: @comment }
    else
      erb :'comments/edit_answer_comment'
    end
  end
end

delete '/answers/:answer_id/comments/:id' do
  authenticate!
  @answer = Answer.find_by(id: params[:answer_id])
  # authorization overkill:
  @comment = Comment.find_by(id: params[:id], comment_author_id: current_user.id)
  authorize!(@comment.comment_author)
  @comment.destroy
  if request.xhr?
    # delete that shit?
  else
    redirect "/questions/#{@answer.question_id}"
  end
end
