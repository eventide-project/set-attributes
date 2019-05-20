require_relative '../../test_init'

context "Attribute Map" do
  context "Add an Unbalanced Mapping" do
    attribute_map = SetAttributes::Map.new

    assert(attribute_map.empty?)

    attribute_map.add(:some_attribute)

    test "Mapping is added and balanced" do
      assert(attribute_map.mapping(:some_attribute) == {:some_attribute => :some_attribute})
    end
  end

  context "Add a Balanced Mapping" do
    attribute_map = SetAttributes::Map.new

    assert(attribute_map.empty?)

    attribute_map.add({:some_attribute => :some_other_attribute})

    test "Mapping is added" do
      assert(attribute_map.mapping(:some_attribute) == {:some_attribute => :some_other_attribute})
    end
  end

  context "Add Many Mappings" do
    attribute_map = SetAttributes::Map.new

    assert(attribute_map.empty?)

    attribute_map.add([:some_attribute, :some_other_attribute])

    test "Mappings are added to the attribute map)" do
      assert(attribute_map.include?(:some_attribute))
      assert(attribute_map.include?(:some_other_attribute))
    end
  end
end
