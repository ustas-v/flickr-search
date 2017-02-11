class ApplicationController < ActionController::Base
  ## Modules, constants

  protect_from_forgery with: :exception

  ## Helpers

  layout -> (controller) { controller.request.xhr? ? false : 'application' }

  ## Before, after and other filters
  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private
end
