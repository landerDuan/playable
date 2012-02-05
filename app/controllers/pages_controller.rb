class PagesController < InheritedResources::Base
  
  def show
    @main_nav = resource.code.to_sym
    @users = User.without_admin if resource.about_page?
    show!
  end

  protected

  def resource
    @page ||= end_of_association_chain.find_by_code(params[:id])
  end

end