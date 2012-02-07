class UsersController < InheritedResources::Base
  main_nav_highlight :members
  before_filter :authenticate_user!
  before_filter :get_related_resources, :only => :show
  
  def checkin
    if current_user.checkin(Time.zone.now, request.remote_ip)
      redirect_to :back, :notice => t('messages.successfully_checked_in')
    else
      redirect_to :back, :notice => t('messages.already_checked_in')
    end
  end
  
  def checkout
    result = current_user.checkout(Time.zone.now, request.remote_ip)

    if !result.present? 
      redirect_to :back, :notice => t('messages.failure_checked_out')
    else
      respond_to do |format|
        format.json { render :json => result }
        format.html { redirect_to :back, :notice => t('messages.successfully_checked_out') }
      end
    end
  end

  protected
  
  def resource
    if params.key?(:username)
      User.find_by_username(parmas[:username])
    elsif params.key(:id)
      User.find(params[:id])
    else
      current_user
    end
  end
  
  def get_related_resources
    @notifiers = resource.notifiers
    @recent_posts = resource.posts.default_order.limit(10)
    
    @reports = if resource.can_manage_reports?
      User.without_admin.map(&:report_on_current_day).flatten.compact
    else
      resource.reports.current_week
    end
    
    @events = if resource.can_manage_events?
      User.without_admin.map(&:event_on_current_day).flatten.compact
    else
      resource.events.current_week
    end
  end
end
