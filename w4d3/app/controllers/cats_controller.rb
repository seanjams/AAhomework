class CatsController < ApplicationController
  before_action :editor_owns_cat, only: [:edit, :update]

  def editor_owns_cat
    @cat = current_user.cats.find_by(id: params[:id])
    unless @cat
      redirect_to cat_url(@cat)
    end
  end

  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    cat_params[:user_id] = current_user.user_id
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :new
    end
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat)
    else
      flash.now[:errors] = @cat.errors.full_messages
      render :edit
    end
  end

  private

  def cat_params
    params.require(:cat)
      .permit(:age, :user_id, :birth_date, :color, :description, :name, :sex)
  end
end
