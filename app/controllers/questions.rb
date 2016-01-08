get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get '/questions/new' do
  erb :"questions/new" unless !authenticated?
end

# HEY! You need to AJAXify me!
post '/questions' do
  author_id = session[:user_id]
  @question = Question.new(title: params[:title], content: params[:content], author_id: author_id)
  if @question.save
    redirect '/questions'
  else
    @errors = @question.errors.full_messages
    erb :"questions/new"
  end
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :"questions/edit"
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answers = @question.answers
  erb :"questions/show"
end

# HEY! You need to AJAXify me!
put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.update_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :errors
  end
end

delete '/questions/:id' do
  question = Question.find(params[:id])
  question.destroy
end
