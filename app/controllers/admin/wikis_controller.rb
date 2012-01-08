class Admin::WikisController < Admin::BaseController
	main_nav_highlight :wikis
	
	protected

	def collection
		@pages ||= end_of_association_chain.page(params[:page])
	end

end