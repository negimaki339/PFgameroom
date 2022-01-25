class My::EventsController < ApplicationController
  before_action :authenticate_user!
  def index
     @team = Team.find(params[:team_id])
     @events = Event.where(team_id:@team.id).reverse#チームのチームIDをもってるイベントを条件指定で表示する
     @current_user_member = current_user.members.find_by(team_id: @team.id)
  end

  def show
     @team = Team.find(params[:team_id])
     @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @team = Team.find(params[:team_id])
    @member = Member.where(user_id:current_user.id,team_id:@team.id).first
    @event = Event.new(event_params)
    @event.team_id = @team.id
    @event.member_id = @member.id
    if @event.save
     redirect_to my_team_events_path(@team.id), notice: "イベントを投稿しました"
    else
     render "my/events/new"
    end
  end

  def edit
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:id])
    if @event.member.user == current_user
      render 'edit'
    else
      redirect_to my_team_events_path
    end

  end


  def update
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to my_team_event_path(@team,@event), notice: "イベント情報を更新しました"
    else
      render "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to my_team_events_path(params[:team_id]), alert: "イベントを削除しました"
  end
private

  def event_params
    params.require(:event).permit(:event_name, :event_explanation, :time)
  end
end

