class UsersController < ApplicationController
  before_action :redirect_if_logged_in

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!
      redirect_to cats_url
    else
      redirect_to cats_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password_digest)
  end
end
