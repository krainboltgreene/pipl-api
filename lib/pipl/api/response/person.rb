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
          [
            :name, :full_names, :nicknames,
            :spellings, :translations, :gender,
            :locations, :ages, :estimated_world_persons_count
          ].each do |accessor|
            value = case send(accessor)
              when Array then send(accessor).map(&:to_hash) if send(accessor).any?
              when Integer then send(accessor) if send(accessor)
              else send(accessor).to_hash if send(accessor)
            end
            { accessor => value }
          end.inject(&:merge!)
        end
        alias_method :to_h, :to_hash


        private

        def nil_or_hash(subject)
          subject.to_hash if subject
        end
      end
    end
  end
end
