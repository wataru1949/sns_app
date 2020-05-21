class GroupsController < ApplicationController

  def new
    @group = Group.new
    @group.group_pictures.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :content, :prefecture_id, group_pictures_attributes:[:group_image])
  end
end
