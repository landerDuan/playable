class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_locale
  def set_locale
    I18n.locale = extract_locale_from_url
  end

  def default_url_options(options={})
    { :locale => I18n.locale }
  end
  
  def extract_locale_from_url
    url = request.fullpath.split("?")[0];
    locale = url.split("/")[1] || params[:locale]
    if  locale.blank?
      :zh
    else
      locale = locale.to_sym
      locale == :zh || locale == :en || locale == :jp ? locale : :zh
    end
  end
end
