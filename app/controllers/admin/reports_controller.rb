class Admin::ReportsController < Admin::BaseController
  main_nav_highlight :reports
  
  protected
  
  def collection
    @users ||= end_of_association_chain.page(params[:page])
  end
  
end
