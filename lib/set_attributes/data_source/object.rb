class SetAttributes
  module DataSource
    class Object
      Error = Class.new(RuntimeError)

      attr_reader :source
      attr_reader :attribute_map

      def initialize(source, attribute_map)
        @source = source
        @attribute_map = attribute_map
      end

      def self.build(source, include=nil, exclude: nil)
        if include.nil?
          raise Error, "Object source source is missing the include mapping"
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
