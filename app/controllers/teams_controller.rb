class TeamsController < ApplicationController

  def index
    @teams = Team.all.reverse #反転　新しい順から表示


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
       @member.save
      redirect_to teams_path(@team)
    else
      @teams = Team.all
      render 'index'
    end
  end

  def edit
    @team = Team.find(params[:id])
    if @team.user == current_user
      render 'edit'
    else
      redirect_to teams_path
    end

  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to myteam_path(@team), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
     @team = Team.find(params[:id])
     pp @team,current_user
    if @team.user_id == current_user.id
     @team.destroy
     redirect_to myteams_path(id:current_user)
    end
  end

private

  def team_params
    params.require(:team).permit(:team_name, :game_name, :team_explanation, :overview, :is_join )
  end
end