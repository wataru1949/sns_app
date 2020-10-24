class GroupMembersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group

  def index
    if @group.group_admin.user_id != current_user.id
      redirect_to group_path(@group)
    end
  end

  def create
    if user_id = params[:id]
      if member = @group.group_members.find_by(user_id: user_id)
        if member.status == "participated"
          flash.notice = "すでに参加しています。"
        elsif member.status == "inviting"
          flash.notice = "すでに招待済みです。"
        elsif member.status == "applying" && member.rejected == true
          member.update(status: "participated", rejected: false)
          flash.notice = "申請を許可しました。"
        elsif member.status == "applying"
          flash.notice = "すでに申請が来ています。"
        end
      else
        @group.group_members.create(user_id: user_id, status: "inviting")
        flash.notice = "グループに招待しました。"
      end
      redirect_to group_members_path(@group)
    else
      @group.group_members.create(user: current_user, status: "applying")
      flash.notice = "参加申請しました。"
      redirect_to group_path(@group)
    end
  end

  def update
    if params[:id]
      member = @group.group_members.find(params[:id])
      member.update(status: "participated")
      flash.notice = "申請を許可しました。"
      redirect_to group_members_path(@group)
    else 
      member = @group.group_members.find_by(user_id: current_user)
      member.update(status: "participated", rejected: false)
      flash.notice = "グループに参加しました。"
      redirect_to group_path(@group)
    end
  end
  
  def reject
    if params[:id]
      member = @group.group_members.find(params[:id])
      member.update(rejected: true)
      redirect_to group_members_path(@group)
    else
      member = @group.group_members.find_by(user_id: current_user)
      member.update(rejected: true)
      redirect_to group_path(@group)
    end
  end

  def destroy
    if params[:id]
      member = @group.group_members.find(params[:id])
      if member.status == "participated"
        member.destroy
        flash.notice = "退会させました。"
      else
        member.destroy
        flash.notice = "招待を取り消しました。"
      end
      redirect_to group_members_path(@group)
    else
      current_member = @group.group_members.find_by(user_id: current_user.id)
      if current_member.status == "participated"
        current_member.destroy
        flash.notice = "グループから退会しました"
      else
        current_member.destroy
        flash.notice = "申請を取り消しました。"
      end
      redirect_to group_path(@group)
    end
  end
  
  private
  def set_group
    @group = Group.find(params[:group_id])
  end
end