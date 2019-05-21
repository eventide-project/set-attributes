require_relative '../../../test_init'

context "Data Source" do
  context "Object" do
    context "Get Value from Source Attribute that Isn't Mapped" do
      mapping = Controls::Mapping::Unbalanced.data

      data = SetAttributes::Controls::Object.example

      object_source = SetAttributes::DataSource::Object.build(data, mapping)

      value = object_source.get_value(SecureRandom.hex.to_sym)

      test "Source value is nil" do
        assert(value.nil?)
      end
    end
  end
end
