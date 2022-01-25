class My::TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :member!, except: [:index]
  def index
    @teams = Team.includes(:members).where(members: {is_approval: 0, user_id: current_user.id}).reverse # チームテーブルとmembersテーブルを結合してmembersテーブルに含まれるユーザがcurrent_userでかつ承認済みの値を取得する
#    @teams = current_user.join_teams #今のユーザーがメンバーとして加入しているチームを表示する
#    @teams = @teams.includes(:).where(is_approval: 0).reverse #メンバーステータスの承認しているメンバーで条件指定する
    #binding.pry
  end

  def show
    @team = Team.find(params[:id])

  end

  def edit
    @team = Team.find(params[:id])
    if @team.user == current_user
      render 'edit'
    else
      redirect_to my_teams_path
    end
  end

  # def update
  #   @team = Team.find(params[:id])
  #   if @team.update(team_params)
  #     redirect_to my_team_path(@team), notice: "You have updated book successfully."
  #   else
  #     render "edit"
  #   end
  # end

  # def destroy
  #   team = team.find(params[:id])
  #   if team.user_id == current_user.id
  #   team.destroy
  #   redirect_to myteam_path(@team)
  #   end
  # end

  private

  def team_params
    params.require(:team).permit(:team_name, :game_name, :team_explanation, :overview, :is_join )
  end

  def member!
    # Memberテーブルに指定されたＩＤと自分が存在しているかチェック
    redirect_to(my_teams_path()) unless Member.where(team_id: params[:id], user_id: current_user.id).exists?
  end


end