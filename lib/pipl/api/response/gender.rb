module Pipl
  module API
    class Response
      class Gender
        attr_reader :code
        attr_reader :estimation

        def initialize(gender)
          @code = gender.first
          @estimation = gender.last
        end

        def to_hash
          {
            code: code,
            estimation: estimation
          }
        end
        alias_method :to_h, :to_hash
      end
    end
  end
end
