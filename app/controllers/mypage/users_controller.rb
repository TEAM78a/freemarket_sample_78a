class Mypage::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :edit_validate
  
  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def edit_validate
    if @user.id != current_user.id
      redirect_to root_path
    end
  end
end
