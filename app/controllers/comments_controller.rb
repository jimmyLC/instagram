class CommentsController < ApplicationController
  before_action :find_photo
  before_action :find_params, only: :destroy

  def index
    @comments = @photo.comments
  end

  def create
    @comment = @photo.comments.build(comment_params)
    if @comment.save
      redirect_to photo_path(@photo)
    end
  end

  def destroy
    @comment.destroy
    redirect_to photo_path(@photo)
  end

  private

  def find_photo
    @photo = Photo.find(params[:photo_id])
  end

  def find_params
    @comment = @photo.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
