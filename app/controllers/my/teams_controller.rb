class My::TeamsController < ApplicationController

  def index
    @teams = current_user.join_teams.reverse
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

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to my_team_path(@team), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def out
  end

   def destroy
     team = team.find(params[:id])
    if team.user_id == current_user.id
     team.destroy
     redirect_to myteam_path(@team)
    end
   end

  private

  def team_params
    params.require(:team).permit(:team_name, :game_name, :team_explanation, :overview, :is_join )
  end
end