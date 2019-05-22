class SetAttributes
  module DataSource
    class Hash
      include DataSource

      def self.verify_mapping(source, include)
        if include.nil?
          return source.keys
        end

        return include
      end

      def get_value(attribute)
        source[attribute]
      end
      alias :[] :get_value

      def attribute?(attribute)
        source.keys.include?(attribute)
      end
    end
  end
end
