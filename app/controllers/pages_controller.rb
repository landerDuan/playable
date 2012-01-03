class PagesController < ApplicationController
  main_nav_highlight :pages

  def index
  	@page = Page.where("code = '#{params[:type]}'").first
  	if params[:local] == 'en'
      @title = @page.title_en
      @content = @page.content_en
    else if params[:local] == 'zh'
      @title = @page.title_zh
      @content = @page.content_zh
    else if
      @title = @page.title_jp
      @content = @page.content_jp
    end
  end
end
