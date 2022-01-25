class TeamsController < ApplicationController
before_action :authenticate_user!
  def index
    @teams = Team.all.page(params[:page]).per(6).reverse_order #反転　新しい順から表示


  end

  def show
    @team = Team.find(params[:id])
    @user = @team.user
    @member = Member.new
    @members = Member.all
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.user_id = current_user.id
    if @team.save
       @member = current_user.members.new
       @member.team_id = @team.id
       @member.is_approval = 0
       @member.save
      redirect_to teams_path(@team), notice: "チームを作成しました"
    else
      render 'new'
    end
  end

  # def edit  editのみmy_teamコントローラーで対応
  #   @team = Team.find(params[:id])
  #   if @team.user == current_user
  #     render 'edit'
  #   else
  #     redirect_to teams_path
  #   end

  # end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to my_team_path(@team), notice: "チーム情報を更新しました"
    else
      render "my/teams/edit"
    end
  end

  def destroy
     @team = Team.find(params[:id])
     pp @team,current_user
    if @team.user_id == current_user.id
     @team.destroy
     redirect_to my_teams_path(id:current_user), alert: "チームを削除しました"
    end
  end

private

  def team_params
    params.require(:team).permit(:team_name, :game_name, :team_explanation, :overview, :is_join )
  end
end