get '/tags' do
  @tags = Tags.all
  erb :index
end

get '/tags/:id' do
  @questions = Tag.find(params[:id]).questions
    erb :'tags/show'
end