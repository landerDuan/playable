class Admin::UsersController < Admin::BaseController
  main_nav_highlight :users
  
  protected
  
  def collection
    @users ||= end_of_association_chain.page(params[:page])
  end
  
end
