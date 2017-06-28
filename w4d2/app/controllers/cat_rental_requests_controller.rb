class CatRentalRequestsController < ApplicationController
  def index
    @cat_rental_requests = CatRentalRequest.all
    render :index
  end

  def show
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request
      render :show
    else
      redirect_to cat_rental_requests_url
    end
  end

  def create
    @cat_rental_request = CatRentalRequest.new(request_params)
    if @cat_rental_request.save
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      flash.now[:error] << @cat_rental_request.errors.full_messages
      render :new
    end
  end

  def new
    @cat_rental_request = CatRentalRequest.new
    render :new
  end

  def update
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    if @cat_rental_request.update_attributes
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      render :edit
    end
  end

  def edit
    @cat_rental_request = CatRentalRequest.find_by(id: params[:id])
    render :edit
  end

  private

  def request_params
    params.require(:cat_rental_requests).permit(:cat_id, :start_date, :end_date, :status)
  end
end
