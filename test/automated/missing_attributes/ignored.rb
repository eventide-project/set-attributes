require_relative '../../test_init'

module Fixture
  module MissingAttributes
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

context "Missing Attributes" do
  receiver = Fixture::MissingAttributes.example
  data = Fixture::MissingAttributes.data

  test "Not an error" do
    refute proc { SetAttributes.(receiver, data) } do
      raises_error?
    end
  end
end
