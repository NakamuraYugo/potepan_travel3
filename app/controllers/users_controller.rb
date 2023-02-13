class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end


  def profile
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    #binding.pry
    if @user.update(user_params)
      redirect_to  profile_user_path, success: "更新できました"
    else
      flash.now['danger'] = "更新できませんでした"
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:user_image, :user_image_cache, :name, :introduction)
  end 

end
