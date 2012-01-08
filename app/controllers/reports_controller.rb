class ReportsController < InheritedResources::Base

  def show
    redirect_to profile_path
  end

  protected
  
  def begin_of_association_chain
    current_user
  end
  
end