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
  if request.xhr?
    erb :"answers/_edit_partial"
  else
    erb :"answers/_edit"
  end
end

put '/questions/:question_id/answers/:answer_id' do
  @question = Question.find(params[:question_id])
  @answer = Answer.find(params[:answer_id])
  @answer.update_attributes(content: params[:answer])
  if @answer.save
    redirect '/questions/#{@question.id}'
  else
    erb :errors
  end
end