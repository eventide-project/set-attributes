class SetAttributes
  attr_reader :receiver
  attr_reader :data_source
  attr_reader :attribute_map

  def strict
    @strict ||= false
  end
  attr_writer :strict

  def initialize(receiver, data_source, attribute_map)
    @receiver = receiver
    @data_source = data_source
    @attribute_map = attribute_map
  end

  def self.build(receiver, source, copy: nil, include: nil, exclude: nil, strict: nil)
    strict ||= false

    unless copy.nil?
      include = copy
    end

    data_source_implementation = DataSource.implementation(source)
    include = data_source_implementation.verify_mapping(source, include)

    attribute_map = SetAttributes::Map.build(include, exclude: exclude)

    data_source = data_source_implementation.build(source)

    new(receiver, data_source, attribute_map).tap do |instance|
      instance.strict = strict
    end
  end

  def self.call(receiver, source, include: nil, copy: nil, exclude: nil, strict: nil)
    instance = build(receiver, source, copy: copy, include: include, exclude: exclude, strict: strict)
    instance.()
  end

  def call
    set_attributes = []

    attribute_map.each_mapping do |source_attribute, receiver_attribute|
      value = data_source.get_value(source_attribute)
      Assign.(receiver, receiver_attribute, value, strict: strict)
      set_attributes << receiver_attribute
    end

    set_attributes
  end
end
