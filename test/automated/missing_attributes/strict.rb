require_relative '../../test_init'

module Fixture
  module MissingAttributesStrict
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
  context "Strict" do
    receiver = Fixture::MissingAttributesStrict.example
    data = Fixture::MissingAttributesStrict.data

    test "Is an error" do
      assert proc { SetAttributes.(receiver, data, strict: true) } do
        raises_error? SetAttributes::Attribute::Error
      end
    end
  end
end
