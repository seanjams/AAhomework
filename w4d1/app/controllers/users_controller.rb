class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(post_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(post_params)
    if @user
      render json: @user
    else
      render json: "User not found", status: :not_found
    end
  end

  def update
    if @user = User.find(post_params)
      @user.update_attributes(post_params)
    else
      render json: "User not found", status: :not_found
    end
  end

  def destroy
    if @user = User.find_by(id: params[:id])
      render json: @user
      @user.delete
    else
      render json: "User not found", status: :not_found
    end
  end

  private

  def post_params
    params.require(:user).permit(:username)
  end

end
