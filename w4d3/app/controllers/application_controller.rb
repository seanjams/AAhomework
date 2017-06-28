class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find_by_session_token(session[:session_token])
  end

  def login!
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    @user.reset_session_token!
    session[:session_token] = @user.session_token
  end

  def redirect_if_logged_in
    if current_user
      redirect_to cats_url
    end
  end
end
