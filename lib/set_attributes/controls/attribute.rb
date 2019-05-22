class SetAttributes
  module Controls
    module Attribute
      def self.some_attribute
        'some value'
      end

      def self.some_other_attribute
        'some other value'
      end

      def self.yet_another_attribute
        'yet another value'
      end

      module Random
        def self.example
          "x#{SecureRandom.hex}".to_sym
        end
      end
    end
  end
end
