$ ->
  $('#search-form').find('button[type=submit]').on 'click', ->
    Flickr.App.Flash.hide()

  $(document).on 'show.bs.modal', '#photo-large-modal', (event) ->
    target = $(event.relatedTarget)

    modal = $(@)
    modal.find('#photo-title').text $(target).data('photo-title')
    modal.find('#photo-view').attr 'src', $(target).data('photo-url')

