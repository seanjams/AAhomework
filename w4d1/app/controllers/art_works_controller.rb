# t.string  "title",     null: false
# t.string  "image_url", null: false
# t.integer "artist_id", null: false

class ArtWorksController < ApplicationController
  def index
    @art_works = ArtWork.all
    render json: @art_works
  end

  def create
    @art_work = ArtWork.new(post_params)
    if @art_work.save
      render json: @art_work
    else
      render json: @art_work.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @art_work = ArtWork.find(post_params)
    if @art_work
      render json: @art_work
    else
      render json: "Artwork not found", status: :not_found
    end
  end

  def update
    if @art_work = ArtWork.find_by(id: params[:id])
      @art_work.update_attributes(post_params)
    else
      render json: "Artwork not found", status: :not_found
    end
  end

  def destroy
    if @art_work = ArtWork.find_by(id: params[:id])
      render json: @art_work
      @art_work.delete
    else
      render json: "Artwork not found", status: :not_found
    end
  end

  private

  def post_params
    params.require(:art_work).permit(:title, :artist_id, :image_url)
  end

end
