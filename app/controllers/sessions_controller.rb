class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      log_in(user)
      params[:user][:remember_me] == 1 ? remember(user) : forget(user)
    else
      render signin_path
    end
  end
end
