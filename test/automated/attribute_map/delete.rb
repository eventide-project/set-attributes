require_relative '../../test_init'

context "Attribute Map" do
  context "Delete a Mapping" do
    mapping = Controls::AttributeMap.example

    attribute_map = SetAttributes::Map.build(mapping)

    assert(attribute_map[:some_attribute] == :some_attribute)

    attribute_map.delete(:some_attribute)

    test "Mapping is removed from the attribute map)" do
      assert(attribute_map.mapping(:some_attribute).nil?)
    end
  end

  context "Delete a Mapping that Doesn't Exist" do
    mapping = Controls::AttributeMap.example

    attribute_map = SetAttributes::Map.build(mapping)

    mappings = attribute_map.mappings

    attribute_map.delete(SecureRandom.hex.to_sym)

    test "Mapping is not removed from the attribute map" do
      assert(attribute_map.mappings == mappings)
    end
  end

  context "Delete Many Mappings" do
    mapping = Controls::AttributeMap.example

    attribute_map = SetAttributes::Map.build(mapping)

    assert(attribute_map.count == 2)

    attribute_map.delete([:some_attribute, :some_other_attribute])

    test "Mappings are removed from the attribute map" do
      assert(attribute_map.empty?)
    end
  end
end
