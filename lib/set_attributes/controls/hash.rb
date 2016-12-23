class SetAttributes
  module Controls
    module Hash
      def self.example
        Controls::Object.example.to_h
      end

      module MissingAttribute
        def self.example
          example = Hash.example
          example.delete(:yet_another_attribute)
          example
        end
      end

      Example = Struct.new(
        :some_attribute,
        :some_other_attribute,
        :yet_another_attribute
      )
    end
  end
end
