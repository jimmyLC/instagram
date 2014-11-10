class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  protected

  def check_fb_login
    unless current_user
      flash[:alert] = "blah"

      redirect_to root_path
    end

  end

  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])

  end
end
