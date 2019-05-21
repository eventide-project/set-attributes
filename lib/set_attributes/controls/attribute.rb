class SetAttributes
  module Controls
    module Attribute
      module Random
        def self.example
          "x#{SecureRandom.hex}".to_sym
        end
      end
    end
  end
end
