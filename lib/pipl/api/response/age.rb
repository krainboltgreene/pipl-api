module Pipl
  module API
    class Response
      class Age
        attr_reader :from, :to
        attr_reader :estimation

        def initialize(age)
          @from = age["from_age"]
          @to = age["to_age"]
          @estimation = age["estimated_percent"].to_f / 100
        end

        def to_range
          @from..@to
        end

        def to_hash
          {
            range: to_range,
            estimation: estimation
          }
        end
        alias_method :to_h, :to_hash
      end
    end
  end
end
