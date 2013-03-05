class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_logged_in?
    return false if cookies[:user_id] and cookies[:user_id].empty?
    cookies[:user_id] ? true : false
  end

  def login_user!
    redirect_to login_users_path unless user_logged_in?
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
