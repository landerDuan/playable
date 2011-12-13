class Admin::PostsController < Admin::BaseController
	main_nav_highlight :posts
 	include_kindeditor
 
	protected
  
  def collection
    @posts ||= end_of_association_chain.page(params[:page])
  end
end