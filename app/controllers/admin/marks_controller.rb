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
      Mark.where('id = ?', @today_checkin_info[:id]).update_all(:checkout_at => @checkout_at)
      redirect_to admin_marks_path
    end
    #转化成时间戳
    #Time.now.to_i
  end
  
  def index
    @mark = Mark.new
    @user_id = current_user[:id]
    @today = Time.now.to_time.to_s[0,10]
    @search_user = params[:mark]
    if @search_user
      @user = User.where("username = '" << @search_user[:user_id] << "'")
      params[:user_id] = @user[0]['id']
      @all_marks = Mark.find(:all, :conditions => ["user_id = :user_id",params], :limit => 1)
    else
      params[:user_id] = @user_id
      params[:checkin_at] = @today
      @today_check_info = Mark.find(:first, :conditions => ["user_id = :user_id AND checkin_at >= :checkin_at",params])
      @all_marks = Mark.all(:order => "id ASC")
    end
    
  end
  
  def search
    @user_name = params[:mark][:user_id]
    @user = User.where("username = '" << @user_name << "'")
    #@user = User.first
    params[:user_id] = @user[0]['id']
    render :text => @user[0]['id']
    @all_marks = Mark.find(:all, :conditions => ["user_id = :user_id",params],:limit => 1)
    #redirect_to admin_marks_path
  end
  
  protected
  
  def collection
    @marks ||= end_of_association_chain.page(params[:page])
  end
  

end
