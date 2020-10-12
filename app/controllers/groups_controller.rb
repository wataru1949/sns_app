class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only:[:edit, :update, :show, :destroy]

  def index
    @search_form = GroupSearchForm.new(search_params)
    @groups = @search_form.search.page(params[:page])
  end

  def search
    @search_form = GroupSearchForm.new
  end

  def new
    @group = Group.new
    @group.group_pictures.new
    @group.group_address = GroupAddress.new
    @group.category = Category.new
  end

  def create
    @group = Group.new(group_params)
    @group.admin = current_user
    @group.category = Category.find_or_initialize_by(category_params[:category_attributes])
    if @group.save
      flash.notice = "グループを作成しました。"
      redirect_to root_path
    else
      @group.group_pictures.clear
      @group.group_pictures.new
      flash.now.alert = "入力に誤りがあります。"
      render :new
    end
  end
  
  def show
    # @group.group_members = @group.group_members.where(approved: true)
    @chat = Chat.new
    @chats = @group.chats.order(created_at: :asc).includes(:user)
  end
  
  
  def edit
  end
  
  def update
    @group.category = Category.find_or_initialize_by(category_params[:category_attributes])
    if @group.update(group_params)
      flash.notice = "グループを編集しました。"
      redirect_to group_path(@group)
    else
      @group.group_pictures = Group.find(params[:id]).group_pictures
      flash.now.alert = "入力に誤りがあります。"
      render :edit
    end
  end

  def destroy
    @group.destroy
    flash.notice = "グループを削除しました。"
    redirect_to root_path
  end

  private
  def group_params
    params.require(:group).permit(:group_name, :content, user_ids: [], group_pictures_attributes:[:group_image, :_destroy, :id], group_address_attributes:[:prefecture_id, :city, :place,])
  end

  def category_params
    params.require(:group).permit(category_attributes:[:value])
  end

  def search_params
    params.require(:search).permit(:group_name, :category, :prefecture_id, :city)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
