get '/questions/:question_id/answers' do
  @answers = Answer.where(question_id: params[:question_id])
  # erb :"answers/index"
end

get '/questions/:question_id/answers/new' do
  # erb :"answers/new"
end

post '/questions/:question_id/answers' do
  @question = Question.find(params[:question_id])
  @author = User.find(session[:user_id])
  @answer = @question.answers.create(content: params[:answer], author_id: @author.id)
  {answer: @answer.content, author: @author.username}.to_json
end

get '/questions/:question_id/answers/:answer_id/edit' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  # erb :"answers/edit"
end

put '/questions/:question_id/answers/:answer_id' do
  @question = Question.find(params[:question_id])
  @answer.update_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :errors
  end
end