class Admin::AdsController < Admin::BaseController
	main_nav_highlight :ads
	
	protected

	def collection
		@pages ||= end_of_association_chain.page(params[:page])
	end

end