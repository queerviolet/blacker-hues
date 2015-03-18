get '/' do
  redirect '/categories'
end

get '/categories' do
  erb(:categories, locals: {categories: Category.all})
end

get '/categories/:id' do
  erb(:category, locals: {category: Category.find(params[:id])})
end
