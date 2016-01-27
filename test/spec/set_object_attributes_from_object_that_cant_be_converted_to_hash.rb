require_relative 'spec_init'

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

context "Setting Attributes from an Object that Can't be Converted to a Hash" do
  test "Is an error" do
    receiver = Fixture::SetFromObjectThatCantBeConvertedToHash.example
    object = Object.new

    begin
      SetAttributes.(receiver, object)
    rescue ArgumentError => error
    end

    assert error
  end
end
