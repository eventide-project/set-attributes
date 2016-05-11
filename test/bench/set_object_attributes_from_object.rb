require_relative 'bench_init'

module Fixture
  module SetFromObject
    class Example
      attr_accessor :some_attribute
      attr_accessor :some_other_attribute
      attr_accessor :yet_another_attribute
    end

    class ConvertsTohash
      def to_h
        {
          some_attribute: 'some value',
          some_other_attribute: 'some other value',
        }
      end
    end

    def self.example
      Example.new
    end

    def self.converts_to_hash
      ConvertsTohash.new
    end
  end
end

context "Setting Attributes" do
  test "Sets attributes from an object that can be converted to a hash" do
    receiver = Fixture::SetFromObject.example
    object = Fixture::SetFromObject.converts_to_hash

    SetAttributes.(receiver, object)

    assert(receiver.some_attribute == 'some value')
    assert(receiver.some_other_attribute == 'some other value')
    assert(receiver.yet_another_attribute.nil?)
  end
end
