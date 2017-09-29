get '/questions' do
  @questions = Question.all

  erb :'questions/index'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @question.increment(:pageviews)
  @question.save

  erb :'questions/show'
end
