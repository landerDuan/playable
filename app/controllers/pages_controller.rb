class PagesController < ApplicationController
  inherit_resources
  main_nav_highlight :pages

  protected

  def resource
    @page ||= end_of_association_chain.find_by_code(params[:id])
  end

end
