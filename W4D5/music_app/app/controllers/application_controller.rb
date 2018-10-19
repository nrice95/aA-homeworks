class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?, :log_in_user!, :log_out!

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    # current_user.session_token == flash[:session_token]
    !!current_user
  end

  def log_in_user!(user)
    # user.session_token = reset_session_token!
    session[:session_token] = user.reset_session_token!
  end

  def log_out!
    current_user.reset_session_token!
    session[:session_token] = nil
  end
end
