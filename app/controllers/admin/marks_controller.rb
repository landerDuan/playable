class Admin::MarksController < Admin::BaseController
  main_nav_highlight :marks
  
  def checkin
    @user_id = 2
    @checkin_at = Time.now
    
    @mark = Mark.new()
    @mark.user_id = @user_id
    @mark.checkin_at = @checkin_at
    @mark.save
    redirect_to admin_marks_path
  end
  
  def checkout
    @user_id = 2
    @checkout_at = Time.now
    
    
    @today = @checkout_at.to_time.to_s[0,10]
    
    params[:user_id] = @user_id
    params[:checkin_at] = @today
    @today_checkin_info = Mark.find(:first, :conditions => ["user_id = :user_id and checkin_at >= :checkin_at",params])
    if @today_checkin_info[:checkout_at]
      #redirect_to admin_marks_path
    end
    Mark.where('id = ?', @today_checkin_info[:id]).update_all(:checkout_at => @checkout_at)

    redirect_to admin_marks_path
    #转化成时间戳
    #Time.now.to_i
  end
  
  protected
  
  def collection
    @marks ||= end_of_association_chain.page(params[:page])
  end
  

end
