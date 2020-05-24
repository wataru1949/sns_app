class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_post, only: [:edit, :update, :show]

  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    if @post.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :event, :detail, :prefecture_id, :accept_id, :date, :start_time, :end_time, :post_image).merge(user_id: current_user.id )
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
