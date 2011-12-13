class Admin::ProductsController < Admin::BaseController
	main_nav_highlight :products
	include_kindeditor
	
protected

  def collection
    @pages ||= end_of_association_chain.page(params[:page])
  end
end
