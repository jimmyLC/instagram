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

end
