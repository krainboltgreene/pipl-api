require_relative "api/version"
require_relative "api/request"
module Pipl
  module API
    def self.api_key=(value)
      @api_key = value
    end

    def self.api_key
      @api_key
    end
  end
end
