get '/questions' do
  @questions = Question.all
  @comment = Comment.first
  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.increment(:pageviews)
  @question.save

  erb :'questions/show'
end

get 'questions/:id/edit' do
  # check_owner_method_here
  @question = Question.find_by(id: params[:id])

  erb :'questions/edit'
end



