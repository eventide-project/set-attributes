class SetAttributes
  attr_reader :attribute_map

  # def include
  #   @include ||= []
  # end
  # attr_writer :include

  # def exclude
  #   @exclude ||= []
  # end
  # attr_writer :exclude

  def strict
    @strict ||= false
  end
  attr_writer :strict

  def initialize(attribute_map)
    @attribute_map = attribute_map
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

    ## This is too late. It's only hash data source that knows this.
    ## Hash data source has to construct the attribute map?
    include = data.keys if include.empty?

    attribute_map = Map.build(include)

    # new(receiver, data).tap do |instance|
    new.tap do |instance|
      instance.include = include
      instance.exclude = exclude
      instance.strict = strict
    end
  end

  def self.call(receiver, data, include: nil, copy: nil, exclude: nil, strict: nil)
    instance = build(copy: copy, include: include, exclude: exclude, strict: strict)
    instance.(receiver, data)
  end

  def call(receiver, data)
    ## ---
    ## Shoring. Remove. Scott Mon May 20 2019
    unless data.is_a? Hash
      data = data.to_h
    end
    ## -

    include_mapping = self.include_mapping
    attributes = (data.keys & include_mapping.keys) - exclude

    set_attributes = []
    attributes.each do |from_attribute|
      to_attribute = include_mapping[from_attribute]

      value = data[from_attribute]

      Set.(receiver, to_attribute, value, strict: strict)

      set_attributes << to_attribute
    end

    set_attributes
  end

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
