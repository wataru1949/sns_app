class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:edit, :update]
  
  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :gender, :age, :prefecture_id, :user_image)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
