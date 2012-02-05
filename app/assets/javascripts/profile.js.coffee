root = exports ? this

# Global settings
$.jGrowl.defaults.life = 6500
$.jGrowl.defaults.sticky = false

# Popup
share_link = share_popup = confirm_link = ""

ajaxTransitions =
  beforeSend: () ->
    $.fancybox.showActivity()
  complete: () ->
    $.fancybox.hideActivity()
    $.fancybox.resize()
    
ajaxOptionsEditReport = (url) ->
  ajaxOptions =
    type:       'POST'
    dataType:   'JSON'
    url:        url + '.json'
    data: '_method=PUT'
    success: (data) ->
      $.jGrowl(data.msg)
      $.fancybox.close()
    error: (xhr, status, error) ->
      $.jGrowl(xhr.responseText)
  $.extend(ajaxOptions, ajaxTransitions)
  
ajaxOptionsNewNote = (url) ->
  ajaxOptions =
    type:       'POST'
    dataType:   'JSON'
    url:        url
    success: (data) ->
      $.jGrowl(data.msg)
      $.fancybox.close()
    error: (xhr, status, error) ->
      $.jGrowl(xhr.responseText)
  $.extend(ajaxOptions, ajaxTransitions)
  
  
fancyboxOptions = 
  'hideOnOverlayClick' : false
  'hideOnContentClick' : false
  'showCloseButton'    : true
  'titleShow'          : false
  'centerOnScroll'     : false
  'padding'            : 0
  'overlayOpacity'     : '0.6'
  'overlayColor'       : '#090909'
  'scrolling'          : 'allowOverflow'
  'onClosed'           : () -> setPopupContent ""


initializeEventHandlers = () ->
  
  # Add report manage event for admin
  confirm_link.click (e) ->
    e.preventDefault()
    setRemoteContent($(this).attr('href'), null, null, activatePopup)
  
  # Close result popup page
  share_popup.on 'click', 'button#close_button', () ->
    $.fancybox.close()

  # submit handler for the editing report form
  share_popup.on 'submit', 'form#edit_report', (e) ->
    e.preventDefault()
    url = $(this).attr('action')
    $(this).ajaxSubmit ajaxOptionsEditReport(url)
    

activatePopup = () -> share_link.trigger('click')

setPopupContent = (data) -> $('#share_popup_content').html data

setRemoteContent = (url, data, options, callback) ->
  ajaxOptions =
    type:     'GET'
    url:      url
    data:     data
    success:  (data) -> setPopupContent data
    complete: () ->
      if callback then callback()
    error: (response) ->
      $.jGrowl response.responseText
  if options
    $.ajax $.extend(ajaxOptions, options)
  else
    $.ajax ajaxOptions

$ ->
  share_link          = $('a#share_action')
  share_popup         = $('#share_popup')
  confirm_link        = $('a.confirm_link')
  
  # Initialize fancybox
  share_link.fancybox(fancyboxOptions)
  
  initializeEventHandlers()
