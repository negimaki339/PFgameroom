class EventsController < ApplicationController

  def index
     @team = Team.find(params[:id])

  end

  def show
     @team = Team.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
private

  def event_params
    params.require(:event).permit(:event_name, :event_explanation)
  end
end

