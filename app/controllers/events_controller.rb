class EventsController < ApplicationController
  main_nav_highlight :events

  def index
  	@event = current_user.events.order("id desc").first
    @events = current_user.events.page(params[:page])
  end

  def check_in
  	@event = Event.new
    @event.user_id = current_user[:id]
    @event.checkin_at = Time.now
    @event.save
  	redirect_to events_path
  end

  def check_out
  	@event = current_user.events.last
  	@event.checkout_at = Time.now
  	@event.save
  	redirect_to events_path
  end
end
