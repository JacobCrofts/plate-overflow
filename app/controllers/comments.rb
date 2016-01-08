get '/questions/:question_id/comments' do
  @comments = Comment.where(question_id: params[:question_id])
  # erb :"answers/index"
end

get '/questions/:question_id/comments/new' do
  # erb :"answers/new"
end

post '/questions/:question_id/comments' do
  puts "************"
  puts "I'm at this route"
  @question = Question.find(params[:question_id])
  @author = User.find(session[:user_id])
  @comment = @question.comments.create(content: params[:comment], author_id: @author.id)
  {comment: @comment.content, author: @author.username}.to_json
end

get '/questions/:question_id/comments/:comment_id/edit' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:answer_id])
  # erb :"answers/edit"
end

put '/questions/:question_id/comments/:comment_id' do
  @question = Question.find(params[:question_id])
  @comment = Comment.find(params[:comment_id])
  @comment.update_attributes(content: params[:comment])
  if @comment.save
    puts "************"
    puts "Saved successfully!"
    erb :"comments/_index", :layout => false, locals: {comment: @comment}
  else
    erb :errors
  end
end
