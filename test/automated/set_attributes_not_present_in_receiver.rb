require_relative '../test_init'

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

context "Setting Attributes not Present in Receiver" do
  test "Isn't an error" do
    receiver = Fixture::SetNotPresent.example
    data = Fixture::SetNotPresent.data

    SetAttributes.(receiver, data)
  end
end

context "In Strict Mode Setting Attributes not Present in Receiver" do
  test "Is an error" do
    receiver = Fixture::SetNotPresent.example
    data = Fixture::SetNotPresent.data

    begin
      SetAttributes.(receiver, data, strict: true)
    rescue SetAttributes::Attribute::Error => error
    end

    assert error
  end
end
