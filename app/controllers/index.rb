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
  thing.tags.destroy(thing.tags.find(params[:tag_id]))
  #redirect "/things/#{params[:id]}"
  puts back
  redirect back
end