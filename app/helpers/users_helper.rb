module UsersHelper
  
  def popover_link_to(text, url_options = {}, html_options = {})
    html_options.merge!(
      :'data-placement' => 'below',
      :rel => 'popover',
      :class => 'should_popover'
    )
    
    link_to(text, url_options, html_options)
  end
end
