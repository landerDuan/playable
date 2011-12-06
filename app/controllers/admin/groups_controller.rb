class Admin::GroupsController < Admin::BaseController
  main_nav_highlight :authorize
    
  def show
    redirect_to admin_groups_path
  end

  def index
  	@collection = Group.all(:order => 'id DESC')  	
  end

  protected
  
  def collection
    @groups ||= end_of_association_chain.page(params[:page])
  end
  
end
