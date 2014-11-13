class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create

  end

  def destroy

  end

  def addfriend
    @friend = User.find(params[:friend_id])
    current_user.add_friend(@friend)

    redirect_to :back
  end

  def unfriend
    @friend = User.find(params[:friend_id])
    current_user.remove_friend(@friend)

    redirect_to :back
  end
end
