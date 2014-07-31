class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @events = Event.all
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.save
    redirect_to @event, notice: "Invitation sent!"

  end

  def show
    @event = Event.find(params[:id])
  end

  private 

  def event_params
    params.require(:event).permit([:start_time, :start_time_date, :start_time_time, :end_time, :description, :invitee_email, :address])
  end
end
