class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      respond_to do |format|
        format.json
      end
    else
      @chats = @group.chats.includes(:user)
      flash.now.alert = "メッセージを入力してください。"
      render "groups/show"
    end
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
