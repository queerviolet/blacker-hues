get '/' do
  erb(:posts, locals: {posts: Post.roots})
end
