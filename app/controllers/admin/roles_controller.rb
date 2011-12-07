class Admin::RolesController < Admin::BaseController
  main_nav_highlight :authorize
  actions :index, :edit, :update, :new, :create, :destroy

  protected
  
  def collection
    @roles ||= end_of_association_chain.page(params[:page])
  end
  
end
