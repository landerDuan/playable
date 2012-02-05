class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout proc { |controller| controller.request.xhr? ? nil : 'application' }
  
  before_filter :initialize_basic_data
  
  rescue_from CanCan::AccessDenied do |exception|
    unless current_user
      redirect_to new_user_session_path
    else
      redirect_to profile_path, :notice => t(:can_not_access)
    end
  end
  
  def after_sign_in_path_for(resource)
    if resource.is_admin?
      admin_users_path
    else
      profile_path
    end
  end
  
  # def set_locale
  #   I18n.locale = extract_locale_from_url
  # end
  
  def default_url_options(options={})
    { :locale => nil }
  end
  
  # def extract_locale_from_url
  #   url = request.fullpath.split("?")[0];
  #   locale = url.split("/")[1] || params[:locale]
  #   if  locale.blank?
  #     :zh
  #   else
  #     locale = locale.to_sym
  #     locale == :zh || locale == :en || locale == :jp ? locale : :zh
  #   end
  # end
  
  def initialize_basic_data
    @top_pages = Page.top
    @bottom_pages = Page.bottom
  end
  
  protected
  
  def hide_topbar
    @hide_topbar = true
  end
end
