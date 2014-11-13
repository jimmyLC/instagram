class PhotosController < ApplicationController
  before_action :find_photo, only: [:show, :edit, :update, :destroy, :like, :unlike]

  def index
    @photos = Photo.all
  end

  def show

  end

  def create
    @photo = Photo.create(photo_params)
    @photo.user = current_user

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

  def like
    like = @photo.likes.build
    like.user = current_user
    like.save

    redirect_to photos_path
  end

  def unlike
    like = @photo.find_user_like(current_user)
    like.destroy

    redirect_to photos_path
  end

  private

  def find_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title ,:avatar, :taglist)
  end
end
