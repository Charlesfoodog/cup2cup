class EventsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @events = Event.all
  end

  def new
    @events = Event.all
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)
    @user = current_user
    if @event.save
      redirect_to @event, notice: "Invitation sent!"
      EventMailer.event_invitation(@event, @user).deliver
    else
      # flash.now[:error] = "Sorry, your question can not be added"
      flash[:error] = @event.errors.full_messages.join('. ')
      render :new
    end
    

  end


  def show
    @event = Event.find(params[:id])
  end

  private 

  def event_params
    params.require(:event).permit([:start_time, :start_time_date, :start_time_time, :end_time, :description, :invitee_email, :address])
  end
end
