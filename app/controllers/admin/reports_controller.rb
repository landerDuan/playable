class Admin::ReportsController < Admin::BaseController
  main_nav_highlight :reports
  
  def show
    redirect_to admin_reports_path
  end
  def index
  	if !params[:user]
  		@uid = current_user[:id]
    else
      @uid = params[:user][:id]
  	end
  	@reports = Report.where('user_id=' << @uid.to_s)
  	@all_user = User.all
    @user = User.new

  end
  
  protected
  
  def collection
     @users ||= end_of_association_chain.page(params[:page])
  end
  
end
