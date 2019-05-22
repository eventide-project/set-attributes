class SetAttributes
  module Controls
    module Object
      def self.example
        example = Example.new

        example.some_attribute = Attribute.some_attribute
        example.some_other_attribute = Attribute.some_other_attribute
        example.yet_another_attribute = Attribute.yet_another_attribute

        example
      end

      class Example
        attr_accessor :some_attribute
        attr_accessor :some_other_attribute
        attr_accessor :yet_another_attribute
      end

      module New
        def self.example
          Object::Example.new
        end
      end

      module MissingAttribute
        def self.example
          example = Example.new

          example.some_attribute = Attribute.some_attribute
          example.some_other_attribute = Attribute.some_other_attribute

          example
        end

        Example = Struct.new(
          :some_attribute,
          :some_other_attribute,
        )
      end

      module Transform
        def self.example
          example = Example.new

          example.an_attribute = Attribute.some_attribute
          example.some_other_attribute = Attribute.some_other_attribute

          example
        end

        Example = Struct.new(
          :an_attribute,
          :some_other_attribute,
        )
      end
    end
  end
end
