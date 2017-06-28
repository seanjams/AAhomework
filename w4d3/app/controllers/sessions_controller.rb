class SessionsController < ApplicationController
  before_action :redirect_if_logged_in

  def new
    render :new
  end

  def create
    login!
    redirect_to cats_url
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
  end
end
