class My::EventsController < ApplicationController

  def index
     @team = Team.find(params[:team_id])
     @events = Event.where(team_id:@team.id)#チームのチームIDをもってるイベントを条件指定で表示する
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
    event = Event.new(event_params)
    event.team_id = @team.id
    event.member_id = @member.id
    event.save
    redirect_to my_team_events_path(@team.id)
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
    team = Team.find(params[:team_id])
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to my_team_event_path(team,event)
    else
      render "edit"
    end
  end

  def destroy
    
  end
private

  def event_params
    params.require(:event).permit(:event_name, :event_explanation, :time)
  end
end

