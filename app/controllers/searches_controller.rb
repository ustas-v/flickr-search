class SearchesController < ApplicationController
  ## Modules, constants
  ## Helpers
  ## Before, after and other filters

  before_action :find_photos, only: [:photos]

  ## Loading and authorize resource(s)
  ## Decorate resource(s)
  ## Responders

  ## Actions

  def index; @results = nil; end

  def photos; end

  ## Protected methods
  ## Callbacks before, after, other filters and etc
  protected

  ## Private methods
  ## Callbacks before, after, other filters and etc
  private

  def service
    @service ||= Services::Searchers::Flickr.new
  end

  def find_photos
    @photos = service.search search_params
  rescue Services::Searchers::Flickr::Error => e
    flash[:error] = t("errors.codes.code_#{e}")
  rescue Exception => e
    flash[:error] = t('errors.service_unavailable')
  end

  def search_params
    params.permit :keywords, :search_type, :page
  end
end
