class Admin::BaseController < ApplicationController
  inherit_resources
  layout 'admin'
  before_filter :authenticate_user!
  
  def create
    create! { collection_path }
  end
  
  def update
    update! { collection_path }
  end
end