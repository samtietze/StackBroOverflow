
##login

get '/sessions/new' do
  erb :"session/new"
end

get '/users' do
  "Hell yea, this shit works!"
end

##authenticate
post '/sessions' do
  @user = User.find_by(email: params[:email])

  if @user && @user.authenticate(params[:email], params[:password])
    session[:user_id] = @user.id
    redirect '/users'
  else
    status 422
    @errors = ["Invalid email and or password"]
    erb :'/session/new'
  end
end


delete '/sessions' do
  session.delete(:user_id)
  redirect '/'
end

# GET RID OF THIS SHIT BEFORE FINAL
get '/sessions/viewer' do
  session.inspect
end

get '/not_authorized' do
  erb :not_authorized
end
