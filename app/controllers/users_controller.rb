class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
