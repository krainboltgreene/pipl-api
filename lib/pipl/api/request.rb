require_relative "request/name"
require_relative "request/get"

module Pipl
  module API
    class Request
      HOST = "api.pipl.com"
      VERSION = "v2"
      SSL = false

      attr_reader :endpoint
      attr_reader :version

      def initialize(endpoint, parameters = {}, ssl = SSL, version = VERSION)
        @endpoint = endpoint
        @protocol = if ssl then "https" else "http" end
        @version = version
        @parameters = parameters
      end

      def call(verb)
        self.class.const_get(verb.capitalize).new(uri).call!(parameters)
      end

      def uri
        protocol + [HOST, endpoint, version, "json"].join("/") + "/"
      end

      def protocol
         "#{@protocol}://"
      end
    end
  end
end
