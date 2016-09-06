class PostsController < ApplicationController
  before_action :logged_in_user?, only: [:new, :create]

  def new
  end

  def create
  end

  private

  def logged_in_user?
    logged_in?
  end
end
