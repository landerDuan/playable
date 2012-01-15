class EventsController < ApplicationController
  inherit_resources
  main_nav_highlight :events

  protected
  
  def collection
    # @events ||= current_user.events.group_by{ |x| x.created_at.beginning_of_week }
    @events ||= Event.scoped.group_by{ |x| x.checkin_at.beginning_of_week }
  end
end
