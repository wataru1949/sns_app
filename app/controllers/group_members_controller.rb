class GroupMembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
  end

  def create
    @group = Group.find(params[:group_id])
    @group.group_members.create(user: current_user)
    flash.notice = "参加申請しました。"
    redirect_to group_path(@group)
  end
end