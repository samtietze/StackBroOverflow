get '/questions' do
  @questions = Question.order('created_at')
  # @comment = Comment.first
  erb :'questions/index'
end

get '/questions/new' do
  redirect '/questions' unless logged_in?
  @question = Question.new
  if request.xhr?
    erb :'questions/new',  layout: false, locals: {question: @question}
  else
    erb :"/questions/new"
  end
end

post '/questions' do
  @question = Question.new(params[:question])
  @question.question_author_id = current_user.id
  if @question.save
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  # Check authors here
  # TODO: Display the edit/delete buttons for questions,
    # answers, and comments based on their author_ids.
  @question = Question.find_by(id: params[:id])
  @question.increment(:pageviews) unless (@question.question_author == current_user)
  @question.save

  erb :'questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  redirect '/not_authorized' unless authorized?(@question.question_author)

  if @question.update_attributes(params[:question])
    redirect "/questions/#{@question.id}"
  else
    @errors = @question.errors.full_messages
    erb :'questions/edit'
  end
end
