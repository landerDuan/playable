class PostsController < InheritedResources::Base
	include_kindeditor
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]
  
  protected
  
  def begin_of_association_chain
    current_user
  end

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