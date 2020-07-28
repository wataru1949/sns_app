class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :show, :destroy]

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
    if current_user
      @comment = Comment.new
      @comments = @post.comments.includes(:user)
    end
  end

  def edit
    if @post.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    
    if @post.update(post_params)
      if @post.remove == "1"
        @post.update_attribute(:post_image, "")
      end
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :event, :detail, :prefecture_id, :accept_id, :event_date, :start_time, :end_time, :post_image, :remove).merge(user_id: current_user.id )
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
