
# This filter logs a user in or creates a new user. It lets us easily
# inline username / password fields in forms that require login,
# decreasing friction.
before do
  if params[:email] and params[:password]
    user = User.find_by(email: params[:email])
    if user
      return 403 unless user.authenticate(params[:password])
    else
      user = User.create!(email: params[:email], password: params[:password])
    end
    session[:user_id] = user.id
  end
end

def current_user
  User.find_by(id: session[:user_id])
end

post '/login' do
  redirect back
end

post '/logout' do
  session[:user_id] = nil
  redirect back
end
