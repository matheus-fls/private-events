module SessionsHelper
  def log_in(user_id)
    session[:user_id] = user_id
  end

  def log_out
    session[:user_id] = nil
  end

  def current_user
    session[:user_id]
  end

  def logged?
    !session[:user_id].nil?
  end
end
