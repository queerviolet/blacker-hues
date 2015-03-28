get '/posts/new' do
  erb(:'posts/edit', locals: {post: nil})
end

get '/posts/:id' do
  post = Post.find_by(id: params[:id])
  return [404, "post not found"] unless post
  erb(:'posts/index', locals: {posts: [post]})
end

get '/posts/:id/edit' do
  post = Post.find_by(id: params[:id])
  return [404, "post not found"] unless post
  erb(:'posts/edit', locals: {post: post, parent: post.parent})
end

def redirect_to_post_or_parent(post)
  if post.parent
    redirect "/posts/#{post.parent.id}"
  else
    redirect "/posts/#{post.id}"
  end
end

post '/posts/' do
  parent = nil
  if params[:parent_id]
    parent = Post.find_by(id: params[:parent_id])
    return [400, "parent post not found"] unless parent
  end
  post = Post.new(content: params[:content], user: User.all.sample, parent: parent)
  return [400, "invalid post"] unless post.valid?
  post.save!
  redirect_to_post_or_parent(post)
end

put '/posts/:id' do
  post = Post.find_by(id: params[:id])
  return [404, "post not found"] unless post
  post.content = params[:content]
  return [400, "invalid post"] unless post.valid?
  post.save!
  redirect_to_post_or_parent(post)
end