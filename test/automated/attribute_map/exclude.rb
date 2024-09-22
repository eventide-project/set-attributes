require_relative '../automated_init'

context "Attribute Map" do
  context "Exclude Alias for Delete" do
    mapping = Controls::Mapping.example

    attribute_map = SetAttributes::Map.build(mapping)

    attribute_map.delete(:some_attribute)

    test "Mapping is removed from the attribute map)" do
      assert(attribute_map.mapping(:some_attribute).nil?)
    end
  end
end
