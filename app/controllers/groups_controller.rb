class GroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_group, only:[:edit, :update, :show]

  def new
    @group = Group.new
    @group.users << current_user
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

  def show
  end


  def edit
  end

  def update
    if @group.save
      #リダイレクト先変更
      redirect_to root_path
    else
      render :edit
    end

  end

  private
  def group_params
    params.require(:group).permit(:group_name, :content, :prefecture_id, user_ids: [], group_pictures_attributes:[:group_image])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
