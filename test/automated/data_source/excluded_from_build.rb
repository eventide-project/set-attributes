require_relative '../../test_init'

context "Data Source" do
  context "Excluded from Build" do
    context "Exclude One Mapping" do
      data_source = SetAttributes::Controls::DataSource.example(exclude: [:some_other_attribute])

      test "Mapped attributes are included" do
        assert(data_source.attribute_map.include?(:some_attribute))
      end

      test "Excluded mapping is removed from the attribute map" do
        refute(data_source.attribute_map.include?(:some_other_attribute))
      end
    end

    context "Exclude Many Mappings" do
      data_source = SetAttributes::Controls::DataSource.example(exclude: [:some_attribute, :some_other_attribute])

      test "Excluded mappings are removed from the attribute map" do
        refute(data_source.attribute_map.include?(:some_attribute))
        refute(data_source.attribute_map.include?(:some_other_attribute))
      end
    end
  end
end
