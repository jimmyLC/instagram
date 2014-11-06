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

  end

  def destroy

  end

  private

  def find_id
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:avatar)
  end
end
