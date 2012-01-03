class Admin::PagesController < Admin::BaseController
	include_kindeditor
	main_nav_highlight :pages
	
	protected
	
	def resource
	 @page ||= end_of_association_chain.find_by_code(params[:id])
	end
end
