post '/login' do
  user = User.find_by(email: params[:email])
  if user
    return 403 unless user.authenticate(params[:password])
  else
    user = User.create!(email: params[:email], password: params[:password])
  end
  session[:user_id] = user.id
  redirect back
end

post '/logout' do
  session[:user_id] = nil
  redirect back
end

# This is a sinatra filter, which attaches information about
# the currently logged in user to every response
after do
  if current_user
    response.headers['X-Current-User-Id'] = "#{current_user.id}"
  end
end

def current_user
  User.find_by(id: session[:user_id])
end
