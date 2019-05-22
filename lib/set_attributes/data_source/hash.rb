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

      def get_value(source_attribute)
        source[source_attribute]
      end
    end
  end
end
