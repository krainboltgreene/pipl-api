module Pipl
  module API
    class Response
      class Location
        attr_reader :code, :state, :country
        attr_reader :estimation

        def initialize(location)
          @code = location["country"]
          if location["display"].include?(",")
            @state = location["display"].split(", ").first
            @country = location["display"].split(", ").last
          else
            @country = location["display"]
          end
          @estimation = location["estimated_percent"].to_f / 100
        end

        def to_hash
          {
            code: code,
            state: state,
            country: country,
            estimation: estimation
          }
        end
        alias_method :to_h, :to_hash

      end
    end
  end
end
