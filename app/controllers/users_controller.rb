class UsersController < ApplicationController
  inherit_resources
  def edit
    @user = User.find(current_user[:id])
  end

  def update
    p @user = User.find(current_user[:id])
    p params[:user]
    if @user.update_attributes(params[:user])
      redirect_to settings_path()
    else

      render settings_path()
    end
  end

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
