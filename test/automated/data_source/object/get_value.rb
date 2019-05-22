require_relative '../../../test_init'

context "Data Source" do
  context "Object" do
    context "Get Value" do
      source = SetAttributes::Controls::Object.example

      object_source = SetAttributes::DataSource::Object.build(source)

      value = object_source.get_value(:some_attribute)

      test "Source value is retrieved by attribute method" do
        assert(value = source.some_attribute)
      end
    end
  end
end
