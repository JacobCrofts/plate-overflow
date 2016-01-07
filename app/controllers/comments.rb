get '/questions/:question_id/comments/new' do
  @question = Question.find(params[:question_id])
  @user = User.find(session[:user_id])
  erb :'comments/new'
end

post '/questions/:question_id/comments' do
  if request.xhr?
    @question = Question.find(params[:question_id])
    @author = User.find(session[:user_id])
    @comment = @question.comments.create(content: params[:comment], author_id: @author.id)
    { comment: @comment.content, author: @author.username }.to_json
  else
    redirect "/questions/#{@question.id}/comments/new"
  end
end