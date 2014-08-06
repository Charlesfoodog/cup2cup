class EventMailer < ActionMailer::Base
  default from: "charles@cup2cup.com"
  require 'googlestaticmap'

  def event_invitation(event, user)
    @event = event
    @time = @event.start_time.strftime("%B %e at %l:%M %p")
    @user = user
    @url = 'http://www.tsn.ca'
    map = GoogleStaticMap.new(:zoom => 15, :center => MapLocation.new(:address => @event.address))
    map.markers << MapMarker.new(:color => "blue", :location => MapLocation.new(:address => @event.address))
    @image_url = map.url('http')
    mail(to: @event.invitee_email, subject: 'Welcome to My Awesome Site')

  end
end
