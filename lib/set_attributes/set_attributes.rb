class SetAttributes
  attr_reader :receiver
  attr_reader :data_source

  def strict
    @strict ||= false
  end
  attr_writer :strict

  def initialize(receiver, data_source)
    @receiver = receiver
    @data_source = data_source
  end

  def self.build(receiver, source, copy: nil, include: nil, exclude: nil, strict: nil)
    strict ||= false

    exclude ||= []
    exclude = Array(exclude)

    unless copy.nil?
      include = copy
    end

    include ||= []
    include = Array(include)

    data_source = SetAttributes::DataSource.build_data_source(source, include, exclude: exclude)

    new(receiver, data_source).tap do |instance|
      instance.strict = strict
    end
  end

  def self.call(receiver, source, include: nil, copy: nil, exclude: nil, strict: nil)
    instance = build(receiver, source, copy: copy, include: include, exclude: exclude, strict: strict)
    instance.()
  end

  def call
    set_attributes = []
    data_source.attribute_map.each_mapping do |source_attribute, receiver_attribute|
      value = data_source.get_value(source_attribute)

      Assign.(receiver, receiver_attribute, value, strict: strict)
      set_attributes << receiver_attribute
    end

    set_attributes
  end
end
