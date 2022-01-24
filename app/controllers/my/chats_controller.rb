class My::ChatsController < ApplicationController

  def index
    @team = Team.find(params[:team_id])
    @chats = Chat.where(team_id:@team.id).reverse
    @current_user_member = current_user.members.find_by(team_id: @team.id)

  end

  def create
    @team = Team.find(params[:team_id])
    @member = Member.where(user_id:current_user.id,team_id:@team.id).first
    comment = Chat.new(chat_params)
    comment.team_id = @team.id
    comment.member_id = @member.id
    comment.save
    @chats = Chat.where(team_id:@team.id).reverse
    # redirect_to my_team_chats_path(@team.id)
  end

  def destroy
    chatcomment = Chat.find_by(id: params[:id])
    chatcomment.destroy
    @team = Team.find(params[:team_id])
    @chats = Chat.where(team_id: @team.id).reverse
    # redirect_to my_team_chats_path(params[:team_id])
  end

  private

  def chat_params
    params.require(:chat).permit(:comment)
  end

end
