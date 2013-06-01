module Pipl
  module API
    class Response
      class Name
        attr_reader :first
        attr_reader :middle
        attr_reader :last

        def initialize(name)
          @first = name["first"]
          @middle = name["middle"]
          @last = name["last"]
        end

        def to_hash
          {
            first: first,
            middle: middle,
            last: last
          }
        end
        alias_method :to_h, :to_hash

      end
    end
  end
end
