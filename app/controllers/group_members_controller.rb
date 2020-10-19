class GroupMembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    # @applying_member = @group.group_members.where(status: "applying", rejected: false).includes(:user)
    
  end

  def create
    @group = Group.find(params[:group_id])
    @group.group_members.create(user: current_user, status: "applying")
    flash.notice = "参加申請しました。"
    redirect_to group_path(@group)
  end

  def destroy
    @group = Group.find(params[:group_id])
    members = @group.group_members.find_by(user_id: current_user.id)
    if members.status == "participated"
      members.destroy
      flash.notice = "グループから退会しました"
    else
      members.destroy
      flash.notice = "申請を取り消しました。"
    end
    redirect_to group_path(@group)
  end
end