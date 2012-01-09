class UsersController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :get_related_resources, :only => :show
  
  def checkin
    if current_user.checkin
      redirect_to :back, :notice => t('messages.successfully_checked_in')
    else
      redirect_to :back, :notice => t('messages.already_checked_in')
    end
  end
  
  def checkout
    result = current_user.checkout
    
    respond_to do |format|
      format.json { render :json => result }
      format.html { redirect_to :back, :notice => t('messages.successfully_checked_out') }
    end
  end

  def show
    @notifiers = current_user.get_user_notifiers
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
    @recent_posts = resource.posts.default_order.limit(10)
  end
end
