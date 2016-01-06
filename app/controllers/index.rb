get '/' do
 erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:email])
  @login = @user.authenticate(params[:email], params[:password])
  if @user && @login
    session[:user_id] = @login.id

    redirect '/questions'
  else

  end
end
