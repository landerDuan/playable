class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout 'admin', :if => :devise_controller?
  
end
