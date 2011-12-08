class Admin::ReportsController < Admin::BaseController
  main_nav_highlight :reports
  protected

  def collection
    if params.key?(:user_id)
      @user = User.find(params[:user_id])
      @search = @user.reports.search(params[:search])
    else
      @search ||= end_of_association_chain.search(params[:search])
    end
    @reports = @search.page(params[:page]) 
  end

end
