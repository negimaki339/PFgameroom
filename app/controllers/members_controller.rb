class MembersController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @members = @team.members
    @user = @team.user
  end


  def create
    @team = Team.find(params[:team_id])
    member = current_user.members.new
    member.team_id = @team.id
    member.save
    redirect_to team_path(@team)
  end

   def destroy
    teammember = Teammember.find_by(id: params[:id])
    @team = teammember.team
    teammember.destroy
   end

  private

  #def member_params
    #params.require(:member).permit(:is_approval)
 # end



end
