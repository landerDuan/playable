class PagesController < ApplicationController
  main_nav_highlight :pages

  def index
  	@page = Page.where("code = '#{params[:type]}'").first
  end
end
