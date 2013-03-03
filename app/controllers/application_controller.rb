class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_logged_in?
    !session[:user_id].nil?
  end

  def current_user
    User.find(cookies[:user_id])
  end

  helper_method :user_logged_in?
  helper_method :current_user

  def sign_in(user)
    cookies[:user_id] = user.id
  end

  def sign_out
    cookies[:user_id] = nil
  end

end
