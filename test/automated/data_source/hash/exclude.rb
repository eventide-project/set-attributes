require_relative '../../../test_init'

context "Data Source" do
  context "Hash" do
    context "Exclude" do
      context "Exclude One Mapping" do
        mapping = Controls::AttributeMap.example

        data = SetAttributes::Controls::Hash.example

        hash_source = SetAttributes::DataSource::Hash.build(data, mapping)

        assert(hash_source.attribute_map.include?(:some_attribute))

        hash_source.exclude(:some_attribute)

        test "Mapping is removed from the attribute map" do
          refute(hash_source.attribute_map.include?(:some_attribute))
        end
      end

      context "Exclude Many Mappings" do
        mapping = Controls::AttributeMap.example

        data = SetAttributes::Controls::Hash.example

        hash_source = SetAttributes::DataSource::Hash.build(data, mapping)

        assert(hash_source.attribute_map.include?(:some_attribute))
        assert(hash_source.attribute_map.include?(:some_other_attribute))

        hash_source.exclude(:some_attribute, :some_other_attribute)

        test "Mappings are removed from the attribute map" do
          refute(hash_source.attribute_map.include?(:some_attribute))
          refute(hash_source.attribute_map.include?(:some_other_attribute))
        end
      end
    end
  end
end
