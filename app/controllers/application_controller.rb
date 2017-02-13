class ApplicationController < ActionController::Base
  ## Modules, constants

  protect_from_forgery with: :exception

  ## Helpers

  layout -> (controller) { controller.request.xhr? ? false : 'application' }

  ## Before, after and other filters

  after_action  :set_flash_to_headers

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

  def set_flash_to_headers
    return if !request.xhr?

    message = flash_message
    return if message.nil? || message[:message].blank?

    response.headers['X-Message']      = URI.encode(message[:message])
    response.headers['X-Message-Type'] = message[:type].to_s

    flash.discard
  end

  def flash_message
    [:error, :warning, :notice, :success].each do |type|
      return { type: type, message: flash[type].to_str } unless flash[type].blank?
    end

    nil
  end
end
