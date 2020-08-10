class GroupsController < ApplicationController
  before_action :set_group, only:[:edit, :update, :show, :destroy]

  def new
    @group = Group.new
    @group.group_pictures.new
    @group.group_address = GroupAddress.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    if @group.save
      redirect_to root_path
    else
      @group.group_pictures.clear
      @group.group_pictures.new
      render :new
    end
  end
  
  def show
    @chat = Chat.new
    @chats = @group.chats.includes(:user)
  end
  
  
  def edit
  end
  
  def update
    if @group.update(group_params)
      redirect_to group_path(@group)
    else
      @group.group_pictures = Group.find(params[:id]).group_pictures
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :content, user_ids: [], group_pictures_attributes:[:group_image, :_destroy, :id], group_address_attributes:[:prefecture_id, :city, :place,])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
