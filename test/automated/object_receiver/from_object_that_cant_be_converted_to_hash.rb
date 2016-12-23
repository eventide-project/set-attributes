require_relative '../../test_init'

module Fixture
  module SetFromObjectThatCantBeConvertedToHash
    class Example
      attr_accessor :some_attribute
      attr_accessor :some_other_attribute
      attr_accessor :yet_another_attribute
    end

    def self.example
      Example.new
    end
  end
end

context "Object Receiver" do
  context "From an Object that Can't be Converted to a Hash" do
    receiver = Fixture::SetFromObjectThatCantBeConvertedToHash.example
    object = Object.new

    test "Is an error" do
      assert proc { SetAttributes.(receiver, object) } do
        raises_error? ArgumentError
      end
    end
  end
end
