get '/users' do
  if session[:user_id]
    redirect "/users/#{session[:user_id]}"
  else
    redirect '/'
  end
end

get '/users/new' do
  if session[:user_id]
    redirect '/'
  else
    erb :'/users/new'
  end
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/login'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @questions = Question.where(author_id: session[:user_id])
  erb :'/users/show'
end
