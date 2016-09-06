class PostsController < ApplicationController
  before_action :logged_in_user?, only: [:new, :create]

  def new
  end

  def create
    post = Post.new(title: params[:post][:title],
                    text:  params[:post][:text])
    if post.valid?
      post.save
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  private

  def logged_in_user?
    logged_in?
  end
end
