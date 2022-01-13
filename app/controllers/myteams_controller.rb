class MyteamsController < ApplicationController

  def index
    @user = User.find(params[:id])
    @teams = @user.teams
  end

  def show
    @team = Team.find(params[:id])

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

  def out
  end

  def destroy
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :game_name, :team_explanation, :overview, :is_join )
  end
end