class ChatsController < ApplicationController

  def index
    @team = Team.find(params[:myteam_id])
    @chats = Chat.where(team_id:@team.id)
  end

  def create
    @team = Team.find(params[:myteam_id])
    @member = Member.where(user_id:current_user.id,team_id:@team.id).first
    comment = Chat.new(chat_params)
    comment.team_id = @team.id
    comment.member_id = @member.id
    comment.save
    redirect_to myteam_chats_path(@team.id)
  end

  def destroy
    chatcomment = Chat.find_by(id: params[:id])
    chatcomment.destroy
    redirect_to myteam_chats_path(params[:myteam_id])
  end

  private

  def chat_params
    params.require(:chat).permit(:comment)
  end

end
