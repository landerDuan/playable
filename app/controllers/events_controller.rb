class EventsController < ApplicationController
  main_nav_highlight :events

  def index
    @status = current_user.events.order("id").last.try(:status)
    @events = current_user.events.page(params[:page])
  end

  def check_in
    @event = current_user.events.order("id").last
    @status = @event.try(:status)
    if @status.blank? || @status == 1
      Event.check_in(current_user[:id])
      redirect_to events_path
    end
  end

  def check_out
    @event = current_user.events.order("id").last
    @status = @event.try(:status)
    if @status == 2
      @event.check_out(current_user[:id])
      redirect_to events_path
    end
  end

end
