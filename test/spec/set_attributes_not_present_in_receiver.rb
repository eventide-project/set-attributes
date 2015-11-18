require_relative 'spec_init'

module Fixture
  module SetNotPresent
    class Example
      attr_accessor :some_attribute
    end

    def self.data
      data = {
        some_attribute_not_present: 'some value not present',
      }
    end

    def self.example
      Example.new
    end
  end
end

describe "Setting Attributes" do
  it "Isn't an error" do
    receiver = Fixture::SetNotPresent.example
    data = Fixture::SetNotPresent.data

    SetAttributes.(receiver, data)
  end
end
