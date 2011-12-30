class EventsController < ApplicationController
  main_nav_highlight :events

  def index
  	@event = current_user.events.order("id desc").first
    @events = current_user.events.order("id desc").page(params[:page])
  end

  def check_in
    @eventInfo = current_user.events.order("id desc").first
    if @eventInfo.blank?
      @event = Event.new
      @event.user_id = current_user[:id]
      @event.checkin_at = Time.now
      @event.save
      redirect_to events_path
    else
      if @eventInfo.checkin_at > Time.now.to_date
        redirect_to events_path
      else
      	@event = Event.new
        @event.user_id = current_user[:id]
        @event.checkin_at = Time.now
        @event.save
    	  redirect_to events_path
      end
    end
  end

  def check_out
    @event = current_user.events.last
    if @event.checkout_at.blank?
    	@event.checkout_at = Time.now
    	@event.save
    end
    redirect_to events_path
  end

end
