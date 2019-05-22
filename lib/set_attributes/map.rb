class SetAttributes
  class Map
    include Enumerable

    def mappings
      @mappings ||= []
    end

    def self.build(mappings, exclude: nil)
      mappings ||= []
      mappings = Array(mappings)

      exclude ||= []
      exclude = Array(exclude)

      instance = new

      mappings.each do |mapping|
        instance.add(mapping)
      end

      instance.exclude(exclude)

      instance
    end

    def self.balance_mapping(mapping)
      return mapping if mapping.is_a? Hash
      { mapping => mapping }
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
      find do |mapping|
        mapping.keys[0] == attribute
      end
    end

    def include?(attribute)
      mapping(attribute) != nil
    end

    def empty?
      count == 0
    end

    def add(*mappings)
      mappings = Array(mappings).flatten

      added_mappings = []
      mappings.each do |mapping|
        balanced_mapping = self.class.balance_mapping(mapping)
        self.mappings << balanced_mapping
        added_mappings << balanced_mapping
      end

      added_mappings
    end
    alias :<< :add

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
    alias :exclude :delete

    def each(&action)
      mappings.each(&action)
    end

    def each_mapping(&action)
      each do |mapping|
        source_attribute = mapping.keys[0]
        receiver_attribute = mapping.values[0]

        action.(source_attribute, receiver_attribute)
      end
    end
  end
end
