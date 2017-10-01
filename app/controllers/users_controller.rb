
##layout add
 ##create
get '/users/new' do
  @user = User.new
  erb :"users/new"
end


post '/users' do
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors = @user.errors.full_messages
    erb :"users/new"
  end
end


##show
get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :"users/show"
end

