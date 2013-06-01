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
          @full_names = Name.new(data["full_names"]) unless data["full_names"] == {}
          @nicknames = Name.new(data["nicknames"]) unless data["nicknames"] == {}
          @spellings = Name.new(data["spellings"]) unless data["spellings"] == {}
          @translations = data["translations"] unless data["translations"] == {}
          @gender = Gender.new(data["gender"])
          @locations = data["top_locations"].map { |location| Location.new(location) }
          @ages = data["top_ages"].map { |age| Age.new(age) }
          @estimated_world_persons_count = data["estimated_world_persons_count"]
        end

        def to_hash
          {
            name: name.to_hash,
            full_names: full_names.to_hash,
            nicknames: nicknames.to_hash,
            spellings: spellings.to_hash,
            translations: translations,
            gender: gender.to_hash,
            locations: locations.map(&:to_hash),
            ages: ages.map(&:to_hash),
            estimated_world_persons_count: estimated_world_persons_count
          }
        end
        alias_method :to_h, :to_hash
      end
    end
  end
end
