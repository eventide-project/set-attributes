require_relative '../../../test_init'

context "Data Source" do
  context "Hash" do
    context "Get Value from Source Attribute that Isn't Mapped" do
      mapping = Controls::Mapping::Unbalanced.data

      data = SetAttributes::Controls::Hash.example

      hash_source = SetAttributes::DataSource::Hash.build(data, mapping)

      value = hash_source.get_value(SecureRandom.hex.to_sym)

      test "Source value is nil" do
        assert(value.nil?)
      end
    end
  end
end
