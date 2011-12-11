class Admin::PagesController < Admin::BaseController
	main_nav_highlight :pages
  protected

  def collection
    @pages ||= end_of_association_chain.page(params[:page])
  end

end
