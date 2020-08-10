class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
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
      redirect_to root_path
    else
      render :edit
    end
  end 


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :gender, :age, :user_image, :remove, user_address_attributes:[:prefecture_id, :city])
  end
end
