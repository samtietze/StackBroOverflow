
get '/questions/:question_id/answers' do
  authenticate!
  @answers = Answers.find_by(id: params[:id])
  erb :'answers/show'
end

get '/questions/:question_id/answers/new' do
  authenticate!
   @question = Question.find(params[:question_id])
  erb :'answers/new'
end

post '/questions/:question_id/answers' do
  authenticate!
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(params[:answer])
    if @answer.save
      # what here
      redirect "/questions/#{@question.id}/answers"
    else
    @errors = @answer.errors.full_messages
    # erb "" what here
    erb :'answers/new'
    end
end

get '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  erb :'answers/show'
end


get '/questions/:question_id/answers/:id/edit' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  erb :'answers/edit'

end

put '/questions/:question_id/answers/:id' do
  @question = Question.find(params[:question_id])
  @answer = @question.answers.find(params[:id])
  if @answer.update(params[:answer])
    redirect "/questions/#{@question.id}/answers"
  else
    @errors = @answer.errors.full_messages
    erb :'answers/edit'
  end

end


delete '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  authorize!(@answer.user)
  @answer.destroy
  redirect  "/questions/#{@question.id}/answers"
end
