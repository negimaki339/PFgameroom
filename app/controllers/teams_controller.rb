class TeamsController < ApplicationController

  def index
    @teams = Team.all
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
      redirect_to team_path(@team)
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
      redirect_to teams_path(@team), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

private

  def team_params
    params.require(:team).permit(:team_name, :game_name, :team_explanation, :overview, :is_join )
  end
end