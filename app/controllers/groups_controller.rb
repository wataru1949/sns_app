class GroupsController < ApplicationController
  before_action :set_group, only:[:edit, :update, :show, :destroy]

  def new
    @group = Group.new
    @group.group_pictures.new
    @group.group_address = GroupAddress.new
    @group.category = Category.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user
    @group.category = Category.find_or_initialize_by(category_params[:category_attributes])
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
    @chats = @group.chats.order(created_at: :asc).includes(:user)
  end
  
  
  def edit
  end
  
  def update
    @group.category = Category.find_or_initialize_by(category_params[:category_attributes])
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

  def category_params
    params.require(:group).permit(category_attributes:[:value])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
