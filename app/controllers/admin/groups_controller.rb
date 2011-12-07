class Admin::GroupsController < Admin::BaseController
  main_nav_highlight :authorize

  protected
  
  def collection
    @groups ||= end_of_association_chain.default_order.page(params[:page])
  end
  
end
