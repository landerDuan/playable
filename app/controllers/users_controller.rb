class UsersController < ApplicationController
  inherit_resources
  def edit
    @user = User.find(current_user[:id])
  end

  def update
    p "111111111111111111111111111"
    p @user = User.find(current_user[:id])
    p "22222222222222222222222222"
    p params[:user]
    if @user.update_attributes(params[:user])
      p "3333333"
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
