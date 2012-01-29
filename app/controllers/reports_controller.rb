class ReportsController < InheritedResources::Base
  include_kindeditor
  
  def show
    redirect_to profile_path
  end

  protected
  
  def begin_of_association_chain
    current_user
  end

  def collection
    @reports ||= current_user.reports.group_by{ |x| x.created_at.beginning_of_week }
  end
  
end