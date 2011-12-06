class Admin::ReportsController < Admin::BaseController
  main_nav_highlight :reports
  
  def show
    redirect_to admin_reports_path
  end
  def index
 		@uid = params[:uid]
  	if !@uid
  		@uid = current_user[:id]
  	end
  	@reports = Report.where('user_id=' << @uid.to_s)
  	@all_user = User.all
  end
  
  protected
  
  def collection
     @users ||= end_of_association_chain.page(params[:page])
  end
  
end
