class HomepageController < ApplicationController
  def index
    if user_signed_in? && (current_user.bio != nil)
      redirect_to new_event_path
    elsif user_signed_in? && (current_user.bio === nil)
      redirect_to after_signup_path(:setup_email)
    end
  end

  def welcome
    @user = User.find(params[:id])
    @event = Event.find(params[:format])
    @time = @event.start_time.strftime("%B %e at %l:%M %p")
    EventMailer.event_reply_yes(@event, @user).deliver
  end

  def welcome_maybe
    @user = User.find(params[:id])
    @event = Event.find(params[:format])
    @time = @event.start_time.strftime("%B %e at %l:%M %p")
    EventMailer.event_reply_maybe(@event, @user).deliver
  end

  def welcome_no
    @user = User.find(params[:id])
    @event = Event.find(params[:format])
    @time = @event.start_time.strftime("%B %e at %l:%M %p")
    EventMailer.event_reply_no(@event, @user).deliver
  end
end
