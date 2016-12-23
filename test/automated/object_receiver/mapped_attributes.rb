require_relative '../../test_init'

module Fixture
  module Mapping
    class Example
      attr_accessor :some_attribute
      attr_accessor :some_other_attribute
      attr_accessor :yet_another_attribute
    end

    def self.data
      {
        an_attribute: 'some value',
        some_other_attribute: 'some other value',
        another_attribute: 'yet another value'
      }
    end

    def self.example
      Example.new
    end
  end
end

context "Object Receiver" do
  receiver = Controls::Object::New.example

  data = {
    an_attribute: 'some value',
    some_other_attribute: 'some other value'
  }

  context "Mapped Attributes" do
    SetAttributes.(receiver, data, include: [
      {:an_attribute => :some_attribute},
      :some_other_attribute
    ])

    test "Sets attributes that correspond to hash keys and mapped hash keys" do
      assert(receiver.some_attribute == 'some value')
      assert(receiver.some_other_attribute == 'some other value')
    end

    test "Does not set attributes that do not have corresponding hash keys" do
      assert(receiver.yet_another_attribute.nil?)
    end
  end
end
