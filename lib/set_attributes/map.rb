class SetAttributes
  class Map # < ::Array
    include Enumerable

    attr_reader :entries

    def initialize(entries)
      @entries = entries
    end

    def self.build(entries)
      balanced_entries = balance(entries)
      new(balanced_entries)
    end

    def self.balance(entries)
      entries.map do |entry|
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

    def mapping(key)
      find { |mapping| mapping.keys[0] == key }
    end

    def keys
      map do |mapping|
        mapping.keys[0]
      end
    end

    def each(&action)
      entries.each(&action)
    end
  end
end
