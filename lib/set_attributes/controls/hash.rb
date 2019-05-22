class SetAttributes
  module Controls
    module Hash
      def self.example
        Controls::Hashish.example.to_h
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

      module Mapped
        def self.example
          {
            :an_attribute => Object.some_attribute,
            :some_other_attribute => Object.some_other_attribute
          }
        end
      end
    end
  end
end
