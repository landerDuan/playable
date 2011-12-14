class Admin::PostsController < Admin::BaseController

	main_nav_highlight :posts
 	include_kindeditor
 
	protected
  
  def collection

    if params.key?(:user_id)
      @user = User.find(params[:user_id])
      @search = @user.post.search(params[:search])
    else
      @search ||= end_of_association_chain.search(params[:search])
    end
    @posts = @search.page(params[:page]) 

  end
end