class PostsController < InheritedResources::Base
  main_nav_highlight :blog
	include_kindeditor :only => [:new, :edit]
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]
  before_filter :load_archives
  
  belongs_to :category, :optional => true

  protected
  
  def load_archives
    @categories = Category.scoped
    @archives = Post.scoped.group_by { |t| t.created_at.beginning_of_month }
  end
  
end