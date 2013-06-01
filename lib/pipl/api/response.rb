require_relative "response/person"
require_relative "response/name"
require_relative "response/age"
require_relative "response/location"
require_relative "response/gender"

module Pipl
  module API
    class Response
      attr_reader :data
      attr_reader :status
      attr_reader :warnings
      attr_reader :person

      def initialize(raw)
        @data = MultiJson.load(raw)
        @status = @data.delete("@http_status_code")
        @warnings = @data.delete("warnings")
        @person = Person.new(@data)
      end

      def ok?
        status == 200
      end
    end
  end
end
