class SetAttributes
  module DataSource
    class Object
      Error = Class.new(RuntimeError)

      attr_reader :data
      attr_reader :attribute_map

      def initialize(data, attribute_map)
        @data = data
        @attribute_map = attribute_map
      end

      def self.build(data, include=nil, exclude: nil)
        if include.nil?
          raise Error, "Object data source is missing the include mapping"
        end

        attribute_map = SetAttributes::Map.build(include)

        instance = new(data, attribute_map)
        instance.exclude(exclude)
        instance
      end

      def get_value(attribute)
        source_attribute = attribute_map[attribute]
        data[source_attribute]
      end

      def exclude(*attributes)
        attribute_map.exclude(attributes)
      end
    end
  end
end
