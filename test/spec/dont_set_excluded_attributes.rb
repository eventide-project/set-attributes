require_relative 'spec_init'

module Fixture
  module DontSetIgnoredAttributes
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

describe "Ignored Attributes" do
  it "Aren't set" do
    receiver = Fixture::DontSetIgnoredAttributes.example
    data = Fixture::DontSetIgnoredAttributes.data

    SetAttributes.(receiver, data, exclude: [:some_other_attribute, :yet_another_attribute])

    assert(receiver.some_attribute == 'some value')
    assert(receiver.some_other_attribute.nil?)
    assert(receiver.yet_another_attribute.nil?)
  end
end
