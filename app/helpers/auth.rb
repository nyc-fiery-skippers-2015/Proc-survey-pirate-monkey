def current_user
  if session[:user_id]
    return User.find(session[:user_id])
  else
    return nil
  end
end

def require_logged_in
redirect('/login') unless is_authenticated?
end

def is_authenticated?
  return !!session[:user_id]
end

def currently_logged_in
  User.find_by(id: session[:user_id])
end
