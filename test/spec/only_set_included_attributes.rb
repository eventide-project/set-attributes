require_relative 'spec_init'

module Fixture
  module OnlySetIncludedAttributes
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

describe "Included Attributes" do
  it "Are set" do
    receiver = Fixture::OnlySetIncludedAttributes.example
    data = Fixture::OnlySetIncludedAttributes.data

    SetAttributes.(receiver, data, include: [:some_other_attribute, :yet_another_attribute])

    assert(receiver.some_attribute.nil?)
    assert(receiver.some_other_attribute == 'some other value')
    assert(receiver.yet_another_attribute == 'yet another value')
  end
end
