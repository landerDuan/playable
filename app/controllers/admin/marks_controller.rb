class Admin::MarksController < Admin::BaseController
  main_nav_highlight :marks
  
  protected
  
  def collection
    @marks ||= end_of_association_chain.page(params[:page])
  end
  
  
  
  def checkin
    @user_id = 2
    @checkin_at = Time.new
    render :text => @checkin_at
    @mark = Mark.new()
    @mark.user_id = @user_id
    @mark.checkin_at = @checkin_at
    if @mark.save
      #redirect_to admin_marks_path
    else
      #redirect_to admin_marks_path
    end
  end
  
  
end
