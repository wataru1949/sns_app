class PostsController < ApplicationController
  
  def index
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


  def post_params
    params.require(:post).permit(:title, :event, :detail, :prefecture_id, :accept, :date, :start_time, :end_time)#.merge(user_id: current_user.id )
  end
end
