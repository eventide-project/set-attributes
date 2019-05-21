class SetAttributes
  module DataSource
    class Object
      include DataSource

      Error = Class.new(RuntimeError)

      def self.assure_include(source, include)
        if include.nil?
          raise Error, "Object source source is missing the include mapping"
        end

        return include
      end

      def get_value(attribute)
        source_attribute = attribute_map[attribute]

        return nil if source_attribute.nil?

        source.send(source_attribute)
      end
    end
  end
end
