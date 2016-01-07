get '/' do
 erb :index
end

get '/login' do
  if session[:user_id]
    redirect '/'
  else
    erb :login
  end
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:email], params[:password])
    session[:user_id] = @user.id
    redirect '/questions'
  else
    @errors = ["credentials must match"]
    erb :'login'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
