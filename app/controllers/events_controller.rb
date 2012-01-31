class EventsController < ApplicationController
  inherit_resources
  main_nav_highlight :events

  protected
  
  def collection
    if current_user.has_event_admin?
  		if params[:search].blank?
  			@search = User.without_admin.first.events.detail_order.search(params[:search])
  		else
  			@search = Event.detail_order.search(params[:search])
  		end
    else
      @search = current_user.events.detail_order.search(params[:search])
    end

    @events = @search.group_by{ |x| x.created_at.beginning_of_week }
  end
  
end
