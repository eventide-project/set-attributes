class SetAttributes
  module DataSource
    class Object
      include DataSource

      Error = Class.new(RuntimeError)

      def self.verify_mapping(source, include)
        if include.nil?
          raise Error, "Object source is missing the include mapping"
        end

        return include
      end

      def get_value(source_attribute)
        return nil unless source.respond_to?(source_attribute)
        source.send(source_attribute)
      end
    end
  end
end
