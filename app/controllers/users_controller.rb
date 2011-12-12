class UsersController < ApplicationController
  inherit_resources
  
  protected
  
  def resource
    if params.key?(:username)
      User.find_by_username(parmas[:username])
    elsif params.key(:id)
      User.find(params[:id])
    else
      current_user
    end
  end
end
