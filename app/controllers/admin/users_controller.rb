class Admin::UsersController < Admin::BaseController
  main_nav_highlight :users
  
  def index
		if current_user['name'] != 'admin'
      respond_to do |format|
        format.html { redirect_to :root, :notice => t('messages.no_permission') }
      end
    end
  end

  protected
  
  def collection
    @users ||= end_of_association_chain.page(params[:page])
  end
  
end
