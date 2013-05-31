module Pipl
  module API
    class Request
      class Name
        def initialize(raw, options = {})
          @raw = raw
        end

        def call
          request.call("get")
        end

        def request
          Request.new("name", raw_name: @raw)
        end
      end
    end
  end
end
