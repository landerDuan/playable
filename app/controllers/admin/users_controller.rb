class Admin::UsersController < Admin::BaseController
  main_nav_highlight :users
  
  def show
    redirect_to admin_users_path
  end

  protected
  
  def collection
    @users ||= end_of_association_chain.page(params[:page])
  end
  
end
