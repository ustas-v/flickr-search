module Services::Searchers
  class Flickr < Base
    class Error < ::StandardError; end
    include Errors

    attr_reader :client

    SEARCH_TYPES = {
      keywords: 2,
      tags:     4
    }

    PER_PAGE = 20

    attribute :keywords,    type: String
    attribute :search_type, type: Integer, default: SEARCH_TYPES[:keywords]
    attribute :page,        type: Integer, default: 1

    def search(params = {})
      assign_attributes params
      validate_attributes! params

      s_key    = search_type == SEARCH_TYPES[:tags] ? 'tags' : 'text'
      s_params = { s_key => keywords, per_page: PER_PAGE, page: page }

      client.photos.search s_params
    end

    private

    def client
      @client ||= ::Flickr.new('config/flickr.yml')
    end

    def validate_attributes!(params)
      fail Error.new ERROR_CODES[:empty_params]   if params.blank?
      fail Error.new ERROR_CODES[:empty_keywords] unless keywords?
      fail Error.new ERROR_CODES[:empty_type]     unless search_type?
      fail Error.new ERROR_CODES[:unknown_type]   unless search_type.in? SEARCH_TYPES.values
    end
  end
end
