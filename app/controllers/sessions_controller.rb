class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(auth_hash)

    reset_session
    session[:user_id] = user.id

    # flash[:notic] = 'login sucsessfully'
    redirect_to root_path
  end

  def failure
    # flash[:alert] = 'login failed'
    redirect_to root_path
  end

  def destroy
    reset_session

    # flash[:notice] = 'logout successfully'
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end
end
