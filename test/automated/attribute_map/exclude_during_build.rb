require_relative '../automated_init'

context "Attribute Map" do
  context "Excluded from Build" do
    mapping = Controls::Mapping.example

    context "Exclude One Mapping" do
      attribute_map = SetAttributes::Map.build(mapping, exclude: [:some_other_attribute])

      test "Mapped attributes are included" do
        assert(attribute_map.include?(:some_attribute))
      end

      test "Excluded mapping is removed from the attribute map" do
        refute(attribute_map.include?(:some_other_attribute))
      end
    end

    context "Exclude Many Mappings" do
      attribute_map = SetAttributes::Map.build(mapping, exclude: [:some_attribute, :some_other_attribute])

      test "Excluded mappings are removed from the attribute map" do
        refute(attribute_map.include?(:some_attribute))
        refute(attribute_map.include?(:some_other_attribute))
      end
    end
  end
end
