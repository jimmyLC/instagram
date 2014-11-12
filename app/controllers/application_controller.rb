class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  before_action :set_locale

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

  def set_locale
  # 可以將 ["en", "zh-TW"] 設定為 VALID_LANG 放到 config/environment.rb 中
  if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
    session[:locale] = params[:locale]
  end

  I18n.locale = session[:locale] || I18n.default_locale
  end
end
