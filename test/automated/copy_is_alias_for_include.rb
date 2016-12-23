require_relative '../test_init'

module Fixture
  module CopyAlias
    class Example
      attr_accessor :some_attribute
      attr_accessor :some_other_attribute
      attr_accessor :yet_another_attribute
    end

    def self.data
      {
        some_attribute: 'some value',
        some_other_attribute: 'some other value',
        yet_another_attribute: 'yet another value'
      }
    end

    def self.example
      Example.new
    end
  end
end

context "Copied Attributes" do
  test "Are set" do
    receiver = Fixture::CopyAlias.example
    data = Fixture::CopyAlias.data

    SetAttributes.(receiver, data, copy: [:some_other_attribute, :yet_another_attribute])

    assert(receiver.some_attribute.nil?)
    assert(receiver.some_other_attribute == 'some other value')
    assert(receiver.yet_another_attribute == 'yet another value')
  end
end
