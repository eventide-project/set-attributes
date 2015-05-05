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

describe "Setting Attributes" do
  it "Sets attributes from an object that can be converted to a hash" do
    receiver = Fixture::SetFromObjectThatCantBeConvertedToHash.example
    object = Object.new

    assert_raises ArgumentError do
      SetAttributes.! receiver, object
    end
  end
end
