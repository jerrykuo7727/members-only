class UsersController < ApplicationController

  def new
  end

  def create
    @user = User.new(name:     params[:user][:name],
                     email:    params[:user][:email],
                     password: params[:user][:password],
                     password_confirmation: params[:user][:password_confirmation])
    if @user.valid?
      @user.save
      log_in(@user)
      redirect_to root_url
    else
      render 'new'
    end
  end
end
