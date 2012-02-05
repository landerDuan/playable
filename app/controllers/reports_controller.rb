class ReportsController < InheritedResources::Base
  include_kindeditor
  
  def update
    update! do |format|
      format.html { redirect_to :back }
      format.json { render :json => { :success => true, :msg => 'ok' }, :status => 200 }
    end
  end
  
  def show
    redirect_to profile_path
  end

  protected
  
  def begin_of_association_chain
    if !current_user.can_manage_reports?
      current_user
    end
  end

  def collection
    @flag = params[:flag].to_i
    if params.key?(:flag)
      start_data = @flag.month.ago.beginning_of_month
      end_data = @flag.month.ago.end_of_month
    else
      start_data = Time.zone.now.beginning_of_month
      end_data = Time.zone.now.end_of_month
    end

    if current_user.can_manage_reports?
      @user_id = params[:user_id] ? params[:user_id] : User.without_admin.first.id
      @user_id = @user_id.to_i
      selected_user = User.find(@user_id)
      
      @reports ||= selected_user.reports.detail_order.where('created_at >= ? AND created_at < ?', start_data, end_data).group_by{ |x| x.created_at.beginning_of_month }
    else
      @user_id = current_user.id
      @reports ||= current_user.reports.detail_order.where('created_at >= ? AND created_at < ?', start_data, end_data).group_by{ |x| x.created_at.beginning_of_month }
    end
    
  end
  
end