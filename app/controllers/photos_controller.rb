class PhotosController < ApplicationController
  before_action :find_id, only: [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all
  end

  def show

  end

  def create
    @photo = Photo.create(photo_params)

    if @photo.save
      redirect_to photos_path
    end
  end

  def edit

  end

  def update
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    end
  end

  def destroy
    @photo.destroy
    redirect_to photos_path
  end

  private

  def find_id
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title ,:avatar, :taglist)
  end
end
