class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @users = User.search(params[:keyword], current_user.id)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(current_user.id)
    @user.user_address ||= @user.build_user_address
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      if @user.remove == "1"
        @user.update_attribute(:user_image, "")
      end
      flash.notice = "アカウント情報を編集しました。"
      redirect_to root_path
    else
      flash.now.alert = "入力に誤りがあります。"
      render :edit
    end
  end 


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :gender, :age, :user_image, :remove, user_address_attributes:[:prefecture_id, :city])
  end
end
