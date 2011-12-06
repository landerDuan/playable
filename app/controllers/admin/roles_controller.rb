class Admin::RolesController < Admin::BaseController
  main_nav_highlight :authorize
    
  def show
    redirect_to admin_roles_path
  end

  protected
  
  def collection
    @roles ||= end_of_association_chain.page(params[:page])
  end
  
end
