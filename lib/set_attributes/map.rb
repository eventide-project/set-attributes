class SetAttributes
  class Map
    include Enumerable

    attr_reader :mappings

    def initialize(mappings)
      @mappings = mappings
    end

    def self.build(mappings)
      balanced_entries = balance(mappings)
      new(balanced_entries)
    end

    def self.balance(mappings)
      mappings.map do |entry|
        mapping = {}
        if entry.is_a? Hash
          mapping[entry.keys.first] = entry.values.first
        else
          mapping[entry] = entry
        end
        mapping
      end
    end

    def [](key)
      mapping = mapping(key)
      values = mapping &.values

      if values.nil?
        nil
      else
        values[0]
      end
    end

    def mapping(attribute)
      find { |mapping| mapping.keys[0] == attribute }
    end

    def keys
      map do |mapping|
        mapping.keys[0]
      end
    end

    def delete(*attributes)
      attributes = Array(attributes).flatten

      deleted_attributes = []
      attributes.each do |attribute|
        mapping = mapping(attribute)
        deleted_attribute = mappings.delete(mapping)
        deleted_attributes << deleted_attribute
      end

      deleted_attributes
    end

    def each(&action)
      mappings.each(&action)
    end
  end
end
