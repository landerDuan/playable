class Admin::CommentsController < Admin::BaseController
	main_nav_highlight :comments

	protected
  
  def collection
    @comments ||= end_of_association_chain.page(params[:page])
  end
end
