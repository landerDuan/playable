class EventsController < ApplicationController
  main_nav_highlight :events

  def index
    @event_last = current_user.events.order("id").last
    @status = @event_last.try(:status)
    if @status == 2
      if @event_last.checkin_at < Time.now.to_date
        @event_last.auto_check_out
        @status = @event_last.try(:status)
      end
    end
    @events = current_user.events.where("created_at >='#{Time.now.beginning_of_week.to_date}'").order("id desc").page(params[:page])
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
