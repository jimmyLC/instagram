class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.create( :friend_id => params[:friend_id] )

    redirect_to users_path
  end

  def destroy

  end

end
