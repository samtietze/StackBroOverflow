get '/' do

  redirect '/questions'
end

get '/mitchell' do
  redirect '/mitchells_voicemail'
end

get '/mitchells_voicemail' do
  erb :mitchells_voicemail
end
