require_relative 'spec_init'
require 'minitest/autorun'

module BlackListedAttribute
  class Example
    attr_accessor :black_listed_attribute
  end

  def self.params
    params = {
      black_listed_attribute: 'some value'
    }
  end

  def self.example
    Example.new
  end
end

describe "Black-listed attributes" do
  it "Doesn't log their values" do
    receiver = BlackListedAttribute.example
    params = BlackListedAttribute.params

    SetAttributes.! receiver, params, /black_listed_attribute/
  end
end
