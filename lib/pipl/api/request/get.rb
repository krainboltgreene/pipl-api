module Pipl
  module API
    class Request
      class Get
        def initialize(uri)
          @uri = uri
        end

        def call!(parameters = {})
          begin
            RestClient.get(@uri, params: parameters)
          rescue => e
            raise e.response
          end
        end
      end
    end
  end
end
