class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render :index # send us to index.html.erb in views
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    if @cat
      render :show
    else
      redirect_to cats_url
    end
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      flash.now[:error] = @cat.errors.full_messages
      render :new
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def update
    @cat = Cat.find_by(id: params[:id])
    if @cat.update_attributes(cat_params)
      redirect_to cat_url(@cat) # goes to show.html.erb in views
    else
      render :edit
    end
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render :edit
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end
