class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :content, :prefecture_id)
  end
end
