class SetAttributes
  module Controls
    module Mapping
      def self.example
        Unary.example
      end

      module Unary
        def self.example
          [
            :some_attribute,
            :some_other_attribute
          ]
        end
      end

      module Unbalanced
        def self.example
          [
            :some_attribute,
            {:some_other_attribute => :some_other_attribute}
          ]
        end
      end

      module Balanced
        def self.example
          [
            {:some_attribute => :some_attribute},
            {:some_other_attribute => :some_other_attribute}
          ]
        end
      end

      module Transform
        def self.example
          [
            {:some_attribute => :some_other_attribute}
          ]
        end
      end
    end
  end
end
