module Pipl
  module API
    class Response
      class Person
        attr_reader :name
        attr_reader :full_names
        attr_reader :nicknames
        attr_reader :spellings
        attr_reader :translations
        attr_reader :locations
        attr_reader :ages
        attr_reader :gender
        attr_reader :estimated_world_persons_count

        def initialize(data)
          @name = Name.new(data["name"])
          @full_names = convert_names(data["full_names"])
          @nicknames = convert_names(data["nicknames"])
          @spellings = convert_names(data["spellings"])
          @translations = convert_names(data["translations"])
          @gender = Gender.new(data["gender"])
          @locations = convert_locations(data["top_locations"])
          @ages = convert_locations(data["top_ages"])
          @estimated_world_persons_count = data["estimated_world_persons_count"]
        end

        def to_hash
          {
            name: name.to_hash,
            full_names: full_names.map(&:to_hash),
            nicknames: nicknames.map(&:to_hash),
            spellings: spellings.map(&:to_hash),
            translations: translations.map(&:to_hash),
            gender: gender.to_hash,
            locations: locations.map(&:to_hash),
            ages: ages.map(&:to_hash),
            estimated_world_persons_count: estimated_world_persons_count
          }
        end
        alias_method :to_h, :to_hash

        private

        def convert_names(list)
          list.map do |part, names|
            names.map { |name| Name.new(part => name) }
          end.flatten
        end

        def convert_locations(list)
          list.map { |location| Location.new(location) }
        end

        def convert_ages(list)
          list.map { |age| Age.new(age) }
        end
      end
    end
  end
end
