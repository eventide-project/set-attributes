require_relative 'set_attributes_init'
require 'minitest/autorun'

module SetObjectAttributes
  class Example
    attr_accessor :some_attribute
    attr_accessor :some_other_attribute
    attr_accessor :yet_another_attribute
  end

  def self.data
    data = {
      some_attribute: 'some value',
      some_other_attribute: 'some other value',
    }
  end

  def self.example
    Example.new
  end
end

describe "Setting Attributes" do
  it "Sets attributes that correspond to hash entries" do
    receiver = SetObjectAttributes.example
    data = SetObjectAttributes.data

    SetAttributes.! receiver, data

    assert(receiver.some_attribute == 'some value')
    assert(receiver.some_other_attribute == 'some other value')
    assert(receiver.yet_another_attribute.nil?)
  end
end
