class WorkdaysController < InheritedResources::Base
	protected
	def  collection
		if current_user.can_manage_workdays?
      		@user_id = params[:user_id] ? params[:user_id] : User.without_admin.first.id
      		@user_id = @user_id.to_i
      		selected_user = User.find(@user_id)
      
      		@workdays ||= selected_user.workdays.detail_order.where('created_at >= ? AND created_at < ?', start_data, end_data).group_by{ |x| x.created_at.beginning_of_month }
    	else
      		@user_id = current_user.id
      		@workdays ||= current_user.workdays.detail_order.where('created_at >= ? AND created_at < ?', start_data, end_data).group_by{ |x| x.created_at.beginning_of_month }
    	end
	end
end
