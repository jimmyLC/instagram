class UsersController < ApplicationController

  def index
    @users = User.all

  end
  def show
    @friends = current_user.friends.all
  end

  def create

  end

  def destroy

  end

  def addfriend
    @friend = current_user.friendships.create(:friend_id => params[:id])
    redirect_to users_path
  end

  def unfriend
    @friend = current_user.friendships.where('friend_id=?', params[:id]).first
    @friend.destroy
    redirect_to users_path
  end
end
