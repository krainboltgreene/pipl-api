module Pipl
  class Client
    class Name
      def initialize(client, name)
        @request = API::Request::Name.new(name, key: client.key)
      end

      def response
        @response ||= API::Response.new(@request.call)
      end
    end
  end
end
