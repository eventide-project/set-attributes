require_relative '../../test_init'

context "Data Source" do
  context "Exclude" do
    context "Exclude One Mapping" do
      data_source = SetAttributes::Controls::DataSource.example

      assert(data_source.attribute_map.include?(:some_attribute))

      data_source.exclude(:some_attribute)

      test "Mapping is removed from the attribute map" do
        refute(data_source.attribute_map.include?(:some_attribute))
      end
    end

    context "Exclude Many Mappings" do
      data_source = SetAttributes::Controls::DataSource.example

      assert(data_source.attribute_map.include?(:some_attribute))
      assert(data_source.attribute_map.include?(:some_other_attribute))

      data_source.exclude(:some_attribute, :some_other_attribute)

      test "Mappings are removed from the attribute map" do
        refute(data_source.attribute_map.include?(:some_attribute))
        refute(data_source.attribute_map.include?(:some_other_attribute))
      end
    end
  end
end
