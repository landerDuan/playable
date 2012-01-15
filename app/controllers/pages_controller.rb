class PagesController < InheritedResources::Base
  
  def show
    @main_nav = resource.code.to_sym
    show!
  end

  protected

  def resource
    @page ||= end_of_association_chain.find_by_code(params[:id])
  end

end