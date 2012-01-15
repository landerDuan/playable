module UsersHelper
  
  def popover_link_to(text, url_options = {}, content = {}, html_options = {})
    html_options.merge!(
      :'data-placement' => 'below',
      :rel => 'popover',
      :'data-content' => content[:content],
      :'data-original-title' => content[:title],
      :class => 'should_popover'
    )
    
    link_to(text, url_options, content, html_options)
  end
end
