class UsersController < ApplicationController
before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
     if @user = current_user
      render 'edit'
    else
      redirect_to root
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to teams_path(@user), notice: "ユーザー情報を更新しました"
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
