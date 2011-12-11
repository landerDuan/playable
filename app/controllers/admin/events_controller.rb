class Admin::EventsController < Admin::BaseController
  main_nav_highlight :events
  
  def checkin
    @user_id = current_user[:id]
    @checkin_at = Time.now
   
    @today = @checkin_at.to_time.to_s[0,10]
    params[:user_id] = @user_id
    params[:checkin_at] = @today
    @today_checkin_info = Event.find(:first, :conditions => ["user_id = :user_id AND checkin_at >= :checkin_at",params])
    if @today_checkin_info
      redirect_to admin_events_path
    else 
      @event = Event.new()
      @event.user_id = @user_id
      @event.checkin_at = @checkin_at
      @event.save
      redirect_to admin_events_path
    end
  end
  
  def checkout
    @user_id = current_user[:id]
    @checkout_at = Time.now
    @today = @checkout_at.to_time.to_s[0,10]
    
    params[:user_id] = @user_id
    params[:checkin_at] = @today
    @today_checkin_info = Event.find(:first, :conditions => ["user_id = :user_id AND checkin_at >= :checkin_at",params])
    if @today_checkin_info[:checkout_at]
      redirect_to admin_events_path
    else
      Event.where('id = ?', @today_checkin_info[:id]).update_attibutes(:checkout_at => @checkout_at)
      redirect_to admin_events_path
    end
  end
  
  protected
  
  def collection
    if params.key?(:user_id)
      @user = User.find(params[:user_id])
      @search = @user.events.search(params[:search])
    else
      @search ||= end_of_association_chain.search(params[:search])
    end
    
    @events = @search.page(params[:page]) 
  end

end