class UsersController < InheritedResources::Base
  
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
end
