class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_logged_in
    redirect_to new_user_url unless logged_in?#change url to new_session_url later
  end

  def require_logged_out
    redirect_to new_user_url if logged_in? #change url to users_url
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  def logout!
    current_user.reset_session_token! if logged_in?
    session[:session_token] = nil
    @current_usesr = nil
  end

end
