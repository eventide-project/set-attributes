class SetAttributes
  module Controls
    module Hash
      def self.example
        {
          :some_attribute => Attribute.some_attribute,
          :some_other_attribute => Attribute.some_other_attribute,
          :yet_another_attribute => Attribute.yet_another_attribute
        }
      end

      module MissingAttribute
        def self.example
          example = Hash.example
          example.delete(:yet_another_attribute)
          example
        end
      end

      module Mapped
        def self.example
          {
            :an_attribute => Attribute.some_attribute,
            :some_other_attribute => Attribute.some_other_attribute
          }
        end
      end
    end
  end
end
