class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to "/posts/#{comment.post.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :comment_image).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def picture_params
    params.require(:picture).permit(:image)
  end
end