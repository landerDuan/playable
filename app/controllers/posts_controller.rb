class PostsController < InheritedResources::Base
  main_nav_highlight :blog
	include_kindeditor :only => [:new, :edit]
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]
  
  def index
    @news_categories_count = current_user.posts.where("category_id = 1").count
    @team_categories_count = current_user.posts.where("category_id = 2").count
    @technology_categories_count = current_user.posts.where("category_id = 3").count

    @posts_month = current_user.posts.group_by{ |x| x.created_at.year.month }
    
  end

  protected
  
  def begin_of_association_chain
    current_user
  end

  def collection
    if params.key?(:user_id)
      @user = User.find(params[:user_id])
      @search = @user.post.search(params[:search])
    elsif params.key?(:category_id)
      @search = current_user.posts.where("category_id = ?", params[:category_id])
    else
      @search ||= end_of_association_chain.search(params[:search])
    end
    @posts = @search.page(params[:page]) 
  end
  
end