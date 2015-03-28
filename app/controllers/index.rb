get '/' do
  erb(:posts, locals: {posts: Post.roots})
end

get '/posts/:id' do
  post = Post.find_by(id: params[:id])
  return 404 unless post
  erb(:posts, locals: {posts: [post]})
end