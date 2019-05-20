require_relative '../../test_init'

context "Attribute Map" do
  context "Add an Unbalanced Mapping" do
    attribute_map = SetAttributes::Map.new

    assert(attribute_map.count == 0)

    attribute_map.add(:some_attribute)

    test "Mapping is added" do
      assert(attribute_map.count == 1)
    end

    test "Mapping is balanced" do
      assert(attribute_map.mapping(:some_attribute) == {:some_attribute => :some_attribute})
    end
  end

  context "Add a Balanced Mapping" do
    attribute_map = SetAttributes::Map.new

    assert(attribute_map.count == 0)

    attribute_map.add({:some_attribute => :some_other_attribute})

    test "Mapping is added" do
      assert(attribute_map.count == 1)
    end

    test "Mapping is balanced" do
      assert(attribute_map.mapping(:some_attribute) == {:some_attribute => :some_other_attribute})
    end
  end

  context "Add Many Mappings" do
    attribute_map = SetAttributes::Map.new

    attribute_map.add([:some_attribute, :some_other_attribute])

    test "Mappings are added to the attribute map)" do
      assert(attribute_map.mappings.count == 2)
    end
  end
end
