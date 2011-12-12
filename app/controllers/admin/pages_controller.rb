class Admin::PagesController < Admin::BaseController
	include_kindeditor
	main_nav_highlight :pages
	
  protected

  def collection
    @pages ||= end_of_association_chain.all()
  end

end
