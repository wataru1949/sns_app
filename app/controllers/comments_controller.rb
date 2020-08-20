class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash.notice = "コメントを投稿しました。"
    end
    redirect_to post_path(comment.post.id)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    flash.notice = "コメントを削除しました。"
    redirect_to post_path(comment.post.id)
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :comment_image).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end