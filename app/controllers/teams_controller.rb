class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
  end

  def new
    @team = Team.new(team_params)
  end

  def create
  @team.user_id = current_user.id
    if @team.save
      redirect_to team_path(@team)
    else
      @teams = Team.all
      render 'index'
    end
  end

end

private

  def team_params
    params.require(:team).permit(:team_name, :game_name, :team_explanation, :overview, :is_join)
  end
