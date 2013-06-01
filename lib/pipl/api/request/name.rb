module Pipl
  module API
    class Request
      class Name
        def initialize(raw, options = {})
          @raw = raw
          @options = options
        end

        def call
          request.call("get")
        end

        private

        def request
          Request.new("name", raw_name: @raw, key: @options[:key] )
        end
      end
    end
  end
end
