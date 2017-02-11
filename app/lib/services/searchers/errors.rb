module Services::Searchers
  module Errors
    ERROR_CODES = {
      empty_params:   2,
      empty_keywords: 4,
      empty_type:     6,
      unknown_type:   8
    }
  end
end
