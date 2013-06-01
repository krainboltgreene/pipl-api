require_relative "client/name"

module Pipl
  class Client
    attr_reader :key

    def initialize(key)
      @key = key
    end

    def name(raw_name)
      Name.new(self, raw_name).response
    end
  end
end
