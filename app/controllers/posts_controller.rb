class PostsController < ApplicationController
  before_action :try_to_auto_login
  before_action :logged_in_user?, only: [:new, :create]

  def new
    @username = current_user.name
  end

  def create
    @post = Post.new(title:   params[:post][:title],
                     text:    params[:post][:text],
                     user_id: current_user.id)
    if @post.valid?
      @post.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
    @username = current_user.name
  end

  private

  def logged_in_user?
    logged_in?
  end

  def try_to_auto_login
    current_user
  end
end
