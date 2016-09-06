class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      # Sign in
    else
      redirect_to '/'
    end
  end
end
