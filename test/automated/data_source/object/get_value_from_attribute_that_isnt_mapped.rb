require_relative '../../../test_init'

context "Data Source" do
  context "Object" do
    context "Get Value from Source Attribute that Isn't Mapped" do
      source = SetAttributes::Controls::Object.example

      object_source = SetAttributes::DataSource::Object.build(source)

      value = object_source.get_value(Controls::Attribute::Random.example)

      test "Source value is nil" do
        assert(value.nil?)
      end
    end
  end
end
