require_relative 'spec_init'

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

describe "Mapped Attributes" do
  it "Are set" do
    receiver = Fixture::Mapping.example
    data = Fixture::Mapping.data

    # SetAttributes.(receiver, data, include: [:some_other_attribute, :yet_another_attribute])
    SetAttributes.(receiver, data, include: [
      {:an_attribute => :some_attribute},
      :some_other_attribute
    ])

    assert(receiver.some_attribute == 'some value')
    # assert(receiver.some_other_attribute == 'some other value')
    # assert(receiver.yet_another_attribute.nil?)
  end
end
