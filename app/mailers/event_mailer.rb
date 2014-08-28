class EventMailer < ActionMailer::Base
  default from: "charles@cup2cup.us"
  require 'googlestaticmap'

  def welcome_email(user)
    @user = user
    @url  = 'http://cup2cup.us'
    mail(to: @user.email, subject: 'Welcome to Cup 2 Cup')
  end

  def event_invitation(event, user)
    @event = event
    @time = @event.start_time.strftime("%B %e at %l:%M %p")
    @user = user
    # @url = 'http://www.cup2cup.herokuapp.com/events/#{@event.id}'
    # @url_yes = welcome_url/#{(user.id)}
    # @url_maybe = "welcome_m_url/'#{(user.id)}'"
    # @url_no = "welcome_n_url/'#{(user.id)}'"
    map = GoogleStaticMap.new(:zoom => 15, :center => MapLocation.new(:address => @event.address))
    map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => @event.address))
    @image_url = map.url('http')
    mail(to: @event.invitee_email, subject: 'Welcome to My Awesome Site')

  end

  def site_trial(user)
    @user = user
    mail(to: @user.email, subject: "Cup2Cup Trial")
  end

  def event_reply_yes(event, user)
    @event = event
    @time = @event.start_time.strftime("%B %e at %l:%M %p")
    @user = user
    map = GoogleStaticMap.new(:zoom => 15, :center => MapLocation.new(:address => @event.address))
    map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => @event.address))
    @image_url = map.url('http')
    mail(to: @user.email, subject: 'Your coffee meeting is planned!')
  end

  def event_reply_maybe(event, user)
    @event = event
    @time = event.start_time.strftime("%B %e at %l:%M %p")
    @user = user
    map = GoogleStaticMap.new(:zoom => 15, :center => MapLocation.new(:address => @event.address))
    map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => @event.address))
    @image_url = map.url('http')
    mail(to: @user.email, subject: 'Your coffee meeting is planned!')
  end

  def event_reply_no(event, user)
    @event = event
    @time = @event.start_time.strftime("%B %e at %l:%M %p")
    @user = user
    map = GoogleStaticMap.new(:zoom => 15, :center => MapLocation.new(:address => @event.address))
    map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => @event.address))
    @image_url = map.url('http')
    mail(to: @user.email, subject: 'Your coffee meeting is planned!')
  end

end
