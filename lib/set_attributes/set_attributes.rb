class SetAttributes
  attr_reader :receiver
  attr_reader :data
  attr_writer :include
  attr_writer :exclude
  attr_writer :strict

  def include
    @include ||= []
  end

  def exclude
    @exclude ||= []
  end

  def strict
    @strict ||= false
  end

  def initialize(receiver, data)
    @receiver = receiver
    @data = data
  end

  def self.build(receiver, data, copy: nil, include: nil, exclude: nil, strict: nil)
    strict ||= false

    unless data.respond_to? :to_h
      raise ArgumentError, "#{data} can't be used to set attributes. It can't be converted to Hash."
    end

    unless data.is_a? Hash
      data = data.to_h
    end

    exclude ||= []
    exclude = Array(exclude)

    unless copy.nil?
      include = copy
    end

    include ||= []
    include = Array(include)
    include = data.keys if include.empty?

    new(receiver, data).tap do |instance|
      instance.include = include
      instance.exclude = exclude
      instance.strict = strict
    end
  end

  def self.call(receiver, data, include: nil, copy: nil, exclude: nil, strict: nil)
    instance = build(receiver, data, copy: copy, include: include, exclude: exclude, strict: strict)

    instance.()
  end
  class << self; alias :! :call; end # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]

  def call
    include_mapping = self.include_mapping
    attributes = (data.keys & include_mapping.keys) - exclude

    set_attributes = []
    attributes.each do |from_attribute|
      to_attribute = include_mapping[from_attribute]

      value = data[from_attribute]

      Attribute.set(receiver, to_attribute, value, strict: strict)

      set_attributes << to_attribute
    end
    set_attributes
  end
  alias :! :call # TODO: Remove deprecated actuator [Kelsey, Thu Oct 08 2015]

  def include_mapping
    mapping = {}
    include.each do |item|
      if item.is_a? Hash
        mapping[item.keys.first] = item.values.first
      else
        mapping[item] = item
      end
    end
    mapping
  end
end
