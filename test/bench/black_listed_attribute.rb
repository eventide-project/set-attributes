require_relative 'bench_init'

module Fixture
  module BlackListedAttribute
    class Example
      attr_accessor :black_listed_attribute
    end

    def self.data
      data = {
        black_listed_attribute: 'some value'
      }
    end

    def self.example
      Example.new
    end
  end
end

context "Black-listed attributes" do
  test "Doesn't log their values" do
    receiver = Fixture::BlackListedAttribute.example
    data = Fixture::BlackListedAttribute.data

    SetAttributes.(receiver, data, log_black_list_regex: /black_listed_attribute/)
  end
end
