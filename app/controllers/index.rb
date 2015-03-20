get '/' do
  erb(:index, locals: {categories: Category.all})
end

get '/categories/:id' do
  erb(:things, locals: {things: Category.find(params[:id]).things})
end

get '/things' do
  erb(:things, locals: {things: Thing.all.limit(25)})
end

get '/things/:id' do
  erb(:thing, locals: {thing: Thing.find(params[:id])})
end

delete '/things/:id/tags/:tag_id' do
  thing = Thing.find(params[:id])
  return [404, 'thing not found'] unless thing
  tag = thing.tags.find(params[:tag_id])
  return [400, 'no such tag'] unless tag
  thing.tags.destroy(tag)
  redirect back
end