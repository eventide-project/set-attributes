class SetAttributes
  module DataSource
    class Hash
      attr_reader :source
      attr_reader :attribute_map

      def initialize(source, attribute_map)
        @source = source
        @attribute_map = attribute_map
      end

      def self.build(source, include=nil, exclude: nil)
        if include.nil? || include.empty?
          include = source.keys
        end

        attribute_map = SetAttributes::Map.build(include)

        instance = new(source, attribute_map)
        instance.exclude(exclude)
        instance
      end

      def get_value(attribute)
        source_attribute = attribute_map[attribute]
        source[source_attribute]
      end

      def exclude(*attributes)
        attribute_map.exclude(attributes)
      end
    end
  end
end
