class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end


  def profile
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, success: "更新できました"
    else
      flash.now[:danger] = "更新できませんでした"
      render :profile
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_image, :name, :introduction)
  end

  
  
end
