$ ->
  $(document).on 'ajaxComplete', (evt, xhr, settings) ->
    flash_type    = xhr.getResponseHeader('X-Message-Type')
    flash_message = decodeURIComponent xhr.getResponseHeader('X-Message')

    if flash_type?.length and flash_message?.length
      switch flash_type
        when 'success'
          Flickr.App.Flash.show_success flash_message
        else
          Flickr.App.Flash.show_error flash_message
