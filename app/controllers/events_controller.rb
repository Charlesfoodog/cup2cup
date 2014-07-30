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
  end

  private 

  def event_params
    params.require(:event).permit([:start_time, :end_time, :description, :invitee_email, :address])
  end
end
