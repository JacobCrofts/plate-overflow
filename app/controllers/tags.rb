get '/tags/show' do
  @tags = Tags.all
  erb :show
end

get '/tags/:id' do
  @questions = Questions.find_by(tag_id)
end