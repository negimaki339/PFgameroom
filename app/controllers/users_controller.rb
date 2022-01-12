class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to teams_path(@user), notice: "You have updated user successfully."
    else
      render "edit"
    end
  end
  #undefined method `update' for nil:NilClassエラーを起こしたので質問した。
  #恐らくupdateと定義されていないとの事で@userが定義されていない？


  private
  def user_params
    params.require(:user).permit(:name, :profile, :profile_image)
  end
end
