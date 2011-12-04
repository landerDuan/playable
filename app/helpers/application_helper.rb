module ApplicationHelper
  def i18n_for_new_link(resource_class)
    t('admin.actions.new', :model => t('activerecord.models.' + resource_class.downcase))
  end
  alias :tt :i18n_for_new_link
end
