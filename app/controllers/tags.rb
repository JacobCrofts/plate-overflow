get '/tags' do
  @tags = Tag.all
  erb :"tags/index"
end

get '/tags/:id' do
  @questions = Tag.find(params[:id]).questions
    erb :"tags/show"
end
