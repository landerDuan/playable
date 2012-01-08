module ApplicationHelper
  def i18n_for_new_link(resource_class)
    t('admin.actions.new', :model => t('activerecord.models.' + resource_class.downcase))
  end
  alias :tt :i18n_for_new_link
  
  
  def menu_link_to(text, url_options = {}, html_options = {})
    if current_page?(url_options)
      html_options[:class] = 'selected'
    end
    link_to(text, url_options, html_options)
  end
end
