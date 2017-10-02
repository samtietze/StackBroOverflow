# get '/questions/:question_id/answers' do
#   authenticate!
#   @answers = Answers.find_by(id: params[:id])
#   erb :'answers/show'
# end

get '/questions/:question_id/answers/new' do
  authenticate!
  @question = Question.find(params[:question_id])
  @answer = Answer.new
  if request.xhr?
    erb :'answers/new', layout: false, locals: {answer: @answer, question: @question}
  else
    erb :'answers/new'
  end
end

post '/questions/:question_id/answers' do
  authenticate!
  @question = Question.find(params[:question_id])
  @answer = Answer.new(params[:answer])
  if @answer.save
    if request.xhr?
      erb :'answers/_answer_container', layout: false, locals: { answer: @answer }
    else
      redirect "/questions/#{@question.id}"
    end
  else
    @errors = @answer.errors.full_messages
    if request.xhr?
      status 422
      erb :"_errors", layout: false, locals: { errors: @errors }
    else
      erb :'answers/new'
    end
  end
end

# get '/questions/:question_id/answers/:id' do
#   @question = Question.find(params[:question_id])
#   @answer = @question.answers.find(params[:id])
#   erb :'answers/show'
# end


get '/questions/:question_id/answers/:id/edit' do
  @answer = Answer.find(params[:id])
  if request.xhr?
    erb :'answers/edit'
  else
    erb :'answers/edit'
  end
end

put '/questions/:question_id/answers/:id' do
  @answer = Answer.find(params[:id])
  if @answer.update(params[:answer])
    if request.xhr?
      erb :'answers/_answer_container', layout: false, locals: { answer: @answer }
    else
      redirect "/questions/#{@answer.question_id}/answers"
    end
  else
    @errors = @answer.errors.full_messages
    if request.xhr?
      status 422
      erb :"_errors", layout: false, locals: { errors: @errors }
    else
      erb :'answers/edit'
    end
  end

end


delete '/questions/:question_id/answers/:id' do
  @answer = Answer.find_by(id: params[:id])
  authorize!(@answer.user)
  @answer.destroy
  redirect  "/questions/#{@question.id}/answers"
end















