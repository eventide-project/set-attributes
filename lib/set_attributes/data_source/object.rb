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

      def get_value(attribute)
        return nil unless attribute?(attribute)
        source.public_send(attribute)
      end
      alias :[] :get_value

      def attribute?(attribute)
        source.respond_to?(attribute)
      end
    end
  end
end
