get '/' do
 erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:email], params[:password])
    session[:user_id] = @user.id
    redirect '/questions'
  else
    redirect '/login'
  end
end
