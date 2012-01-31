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

    if current_user.has_event_admin?
    
    else
      @reports ||= current_user.reports.group_by{ |x| x.created_at.beginning_of_month }
    end
    
  end
  
end





# def collection
#     if current_user.has_event_admin?
#       if params[:search].blank?
#         @search = User.without_admin.first.events.search(params[:search])
#       else
#         @search = Event.search(params[:search])
#       end
#     else
#       @search = current_user.events.search(params[:search])
#     end
#   @events = @search.group_by{ |x| x.created_at.beginning_of_week }
# end