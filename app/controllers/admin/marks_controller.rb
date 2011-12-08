class Admin::MarksController < Admin::BaseController
  main_nav_highlight :marks
  
  def checkin
    @user_id = current_user[:id]
    @checkin_at = Time.now
   
    @today = @checkin_at.to_time.to_s[0,10]
    params[:user_id] = @user_id
    params[:checkin_at] = @today
    @today_checkin_info = Mark.find(:first, :conditions => ["user_id = :user_id AND checkin_at >= :checkin_at",params])
    if @today_checkin_info
      redirect_to admin_marks_path
    else 
      @mark = Mark.new()
      @mark.user_id = @user_id
      @mark.checkin_at = @checkin_at
      @mark.save
      redirect_to admin_marks_path
    end
  end
  
  def checkout
    @user_id = current_user[:id]
    @checkout_at = Time.now
    @today = @checkout_at.to_time.to_s[0,10]
    
    params[:user_id] = @user_id
    params[:checkin_at] = @today
    @today_checkin_info = Mark.find(:first, :conditions => ["user_id = :user_id AND checkin_at >= :checkin_at",params])
    if @today_checkin_info[:checkout_at]
      redirect_to admin_marks_path
    else
      Mark.where('id = ?', @today_checkin_info[:id]).update_attibutes(:checkout_at => @checkout_at)
      redirect_to admin_marks_path
    end
  end
  
  protected
  
  def collection
    if params.key?(:user_id)
      @user = User.find(params[:user_id])
      @search = @user.marks.search(params[:search])
    else
      @search ||= end_of_association_chain.search(params[:search])
    end
    
    @marks = @search.page(params[:page]) 
  end

end