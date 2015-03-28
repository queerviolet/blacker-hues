get '/posts/new' do
  erb(:'posts/edit', locals: {post: nil, parent: nil})
end

get '/posts/:id' do
  posts = Post.where(id: params[:id])
  return [404, 'post not found'] unless posts.length > 0
  erb(:'posts/index', locals: {posts: posts})
end

get '/posts/:id/edit' do
  post = Post.find_by(id: params[:id])
  return [404, 'post not found'] unless post
  erb(:'posts/edit', locals: {post: post, parent: post.parent})
end

get '/posts/:parent_id/reply' do
  parent = nil
  if params.include?(:parent_id)
    parent = Post.find_by(id: params[:parent_id])
    return [404, "post not found"] unless parent
  end
  erb(:'posts/edit', locals: {post: nil, parent: parent})
end

post '/posts/' do
  parent = nil
  if params[:parent_id]
    parent = Post.find_by(id: params[:parent_id])
    return [400, 'parent post not found'] unless parent
  end
  post = Post.new(content: params[:content], user: User.all.sample, parent: parent)
  return [400, 'invalid post'] unless post.valid?
  post.save!
  response.headers['X-Created-Post-Id'] = "#{post.id}"
  response.headers['X-Created-Post-Url'] = "/posts/#{post.id}"
  redirect back
end

put '/posts/:id' do
  post = Post.find_by(id: params[:id])
  return [404, 'post not found'] unless post
  post.content = params[:content]
  return [400, 'invalid post'] unless post.valid?
  post.save!
  redirect back
end