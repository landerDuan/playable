class EventsController < ApplicationController
  inherit_resources
  main_nav_highlight :events

  protected
  
  def collection
    @events ||= current_user.events.get_week_events.page(params[:page])
  end
end
