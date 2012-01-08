class PostsController < InheritedResources::Base
  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update]
  
  protected
  
  def begin_of_association_chain
    current_user
  end
  
end