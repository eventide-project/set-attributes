require_relative '../../../test_init'

context "Data Source" do
  context "Hash" do
    context "Mapping is Omitted" do
      data = SetAttributes::Controls::Hash.example

      hash_source = SetAttributes::DataSource::Hash.build(data)

      test "Hash's keys are used as the mapping" do
        assert(hash_source.attribute_map.keys == data.keys)
      end
    end
  end
end
