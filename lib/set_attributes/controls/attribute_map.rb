class SetAttributes
  module Controls
    module AttributeMap
      def self.example
        Unary.data
      end

      module Unary
        def self.data
          [
            :some_attribute,
            :some_other_attribute
          ]
        end
      end

      module Unbalanced
        def self.data
          [
            :some_attribute,
            {:some_other_attribute => :some_other_attribute}
          ]
        end
      end

      module Balanced
        def self.data
          [
            {:some_attribute => :some_attribute},
            {:some_other_attribute => :some_other_attribute}
          ]
        end
      end

      module Transform
        def self.data
          [
            {:some_attribute => :some_other_attribute}
          ]
        end
      end
    end
  end
end
