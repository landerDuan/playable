class Admin::ReportsController < Admin::BaseController
  main_nav_highlight :reports
  
  def show
    redirect_to admin_reports_path
  end
  
  protected
  
  def collection
    @users ||= end_of_association_chain.page(params[:page])
  end
  
end
