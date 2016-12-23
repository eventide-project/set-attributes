require_relative '../../test_init'

module Fixture
  module SetFromHash
    class Example
      attr_accessor :some_attribute
      attr_accessor :some_other_attribute
      attr_accessor :yet_another_attribute
    end

    def self.data
      data = {
        some_attribute: 'some value',
        some_other_attribute: 'some other value',
      }
    end

    def self.example
      Example.new
    end
  end
end

context "Object Receiver" do
  context "From Hash" do
    receiver = Fixture::SetFromHash.example
    data = Fixture::SetFromHash.data

    SetAttributes.(receiver, data)

    test "Sets attributes that correspond to hash keys" do
      assert(receiver.some_attribute == 'some value')
      assert(receiver.some_other_attribute == 'some other value')
      assert(receiver.yet_another_attribute.nil?)
    end
  end
end
