require_relative '../../../test_init'

context "Data Source" do
  context "Hash" do
    context "Get Value" do
      source = SetAttributes::Controls::Hash.example

      hash_source = SetAttributes::DataSource::Hash.build(source)

      value = hash_source.get_value(:some_attribute)

      test "Source value is retrieved by indexer and key" do
        assert(value = source[:some_attribute])
      end
    end
  end
end
