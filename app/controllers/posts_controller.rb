class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @search_form = PostSearchForm.new(search_params)
    @posts = @search_form.search.page(params[:page])
  end
  
  def new
    @post = Post.new
    @post.post_address = PostAddress.new
    @post.category = Category.new
  end

  def create
    @post = Post.new(post_params)
    @post.category = Category.find_or_initialize_by(category_params[:category_attributes])
    if @post.save
      flash.notice = "投稿が完了しました。"
      redirect_to root_path
    else
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end

  def show  
    if current_user
      @comment = Comment.new
    end
    @comments = @post.comments.includes(:user).page(params[:page]).order(created_at: :desc)
  end

  def edit
    if @post.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @post.category = Category.find_or_initialize_by(category_params[:category_attributes])
    if @post.update(post_params)
      if @post.remove == "1"
        @post.update_attribute(:post_image, "")
      end
      flash.notice = "投稿を編集しました。"
      redirect_to @post
    else
      flash.now.alert = "入力に誤りがあります。"
      render :edit
    end
  end

  def destroy
    @post.destroy
    flash.notice = "投稿を削除しました。"
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :detail, :accept_id, :event_date, :start_time, :end_time, :post_image, :remove, post_address_attributes:[:prefecture_id, :city, :place]).merge(user_id: current_user.id )
  end

  def category_params
    params.require(:post).permit(category_attributes:[:value])
  end

  def search_params
    params[:search]&.permit([:category, :event_date, :prefecture_id, :city])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
