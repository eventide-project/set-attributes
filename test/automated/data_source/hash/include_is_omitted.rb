require_relative '../../../test_init'

context "Data Source" do
  context "Hash" do
    context "Include is Omitted" do
      source = SetAttributes::Controls::Hash.example

      _, attribute_map = SetAttributes::DataSource::Hash.build(source)

      test "Hash's keys are used as the mapping" do
        assert(attribute_map.keys == source.keys)
      end
    end
  end
end
