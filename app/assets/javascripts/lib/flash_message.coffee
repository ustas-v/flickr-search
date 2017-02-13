namespace 'Flickr.Lib'

class Flickr.Lib.FlashMessage
  constructor: (@container) ->
    # Override bootstrap's data-dismiss function
    @container.find('button.close').on 'click', =>
      $(@container).hide()

  show_success: (message) ->
    @_initialize_and_show 'success', message

  show_error: (message) ->
    @_initialize_and_show 'danger', message

  hide: ->
    @container.hide()

  _initialize_and_show: (type, message) ->
    @container.removeClass 'alert-success alert-danger'
    @container.addClass "alert-#{type}"

    @container.find('#flash-message').html message
    @container.show()
