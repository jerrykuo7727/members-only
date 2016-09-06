class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def log_out(user)
    session.delete(:user_id)
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def current_user
    if user_id = session[:user_id]
      @current_user ||= User.find_by_id(user_id)
    elsif user_id = cookies.signed[:user_id]
      user = User.find_by_id(user_id)
      remember_token = cookies[:remember_token]
      if user && remember_token &&
         Digest::SHA1.hexdigest(remember_token) == user.remember_digest
        log_in user
        @current_user = user
      end
    end
  end

  def logged_in?
    session[:user_id]
  end

  private

  def current_user=(user)
    @current_user = user
  end
end
