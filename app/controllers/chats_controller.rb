class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    chat = Chat.new(chat_params)
    chat.save
    redirect_to group_path(chat.group.id)
  end

  def destroy
    chat = Chat.find(params[:id])
    chat.destroy
    redirect_to group_path(chat.group.id)
  end

  private
  def chat_params
    params.require(:chat).permit(:body, :chat_image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
