
get '/questions/:question_id/answers' do
  # HELPER METHOD TO AUTHENTICATE
  @answers = Answers.find_by(id: params[:id])
  erb :'answers/show'


end
