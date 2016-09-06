class PostsController < ApplicationController
  before_action :try_to_auto_login
  before_action :logged_in_user?, only: [:new, :create]

  def new
    @username = current_user.name unless current_user.nil?
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
    WillPaginate.per_page = 5
    if params[:name].nil?
      @posts = Post.paginate(page: params[:page]).order(created_at: :desc)
    else
      @posts = current_user.posts.paginate(page: params[:page]).order(created_at: :desc)
    end
    @username = current_user.name unless current_user.nil?
  end

  private

  def logged_in_user?
    logged_in?
  end

  def try_to_auto_login
    current_user
  end
end
