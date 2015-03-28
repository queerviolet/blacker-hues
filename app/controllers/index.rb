get '/' do
  erb(:'posts/index', locals: {posts: Post.roots})
end