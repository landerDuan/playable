class EventsController < ApplicationController
  inherit_resources
  main_nav_highlight :events

  protected
  
  def collection
  	if current_user.can_manage_events?
  		if params[:user_id].blank?
  			@events_all = User.without_admin.first.events
        @user_id = User.without_admin.first.id
  		else
        @user = User.find(params[:user_id])
  			@events_all = @user.events
        @user_id = @user.id
  		end
    else
      @events_all = current_user.events
      @user_id = current_user.id
    end

    if params[:month].blank?
      @events = @events_all.where('created_at >=?', Time.zone.now.beginning_of_month)
      @date = Time.zone.now.beginning_of_month
    else
      @events = @events_all.where("created_at >= '#{params[:month].to_time.beginning_of_month}' and created_at <= '#{params[:month].to_time.end_of_month}'")
      @date = params[:month].to_date
    end
	end
end
