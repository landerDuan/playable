class Admin::UsersController < Admin::BaseController
  
  protected
  
  def collection
    @users ||= end_of_association_chain.page(params[:page])
  end
  
end
