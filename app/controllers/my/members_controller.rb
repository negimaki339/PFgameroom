class My::MembersController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @members = @team.member_list
    @current_user_member = current_user.members.find_by(team_id: @team.id)
    #@user = User.find(params[:team_id])
    #@user = @team.user
    #@member = @team.current_user
    #@user = Current_user
  end

  def join
    @team = Team.find(params[:team_id])
    @members = @team.wait_member_list
  end

  def update
    @team = Team.find(params[:team_id])
    @approval_member = @team.members.find(params[:id])
    @approval_member.is_approval = 0
    @approval_member.save
    redirect_to my_team_members_path(@team)
  end

  def create

    @team = Team.find(params[:team_id])
    member = current_user.members.new
    member.team_id = @team.id
    if @team.free?  #自由加入制
      member.is_approval = 0  #承認
    else #承認制でみなす
      member.is_approval = 2 #承認待ち
    end
    member.save
    redirect_to team_path(@team)
  end

   def destroy
    @team = Team.find(params[:team_id])
    member = Member.find(params[:id])

    member.destroy
    redirect_to my_team_members_path(@team)
   end

  private

  #def member_params
    #params.require(:member).permit(:is_approval)
 # end



end
