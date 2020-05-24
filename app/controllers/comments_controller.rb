class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to post_path(comment.post.id)
  end

  def edit
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to post_path(comment.post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :comment_image).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end