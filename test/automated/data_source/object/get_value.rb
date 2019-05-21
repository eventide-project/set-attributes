require_relative '../../../test_init'

context "Data Source" do
  context "Object" do
    context "Get Value" do
      context "Source Attribute Name and Receiver Attribute Name Are the Same" do
        mapping = Controls::AttributeMap::Unbalanced.data

        data = SetAttributes::Controls::Object.example

        object_source = SetAttributes::DataSource::Object.build(data, mapping)

        value = object_source.get_value(:some_attribute)

        test "Source value is retrieved by the receiver attribute name" do
          assert(value = data.some_attribute)
        end
      end

      context "Source Attribute Name and Receiver Attribute Name Are Not the Same" do
        mapping = Controls::AttributeMap::Transform.data

        data = SetAttributes::Controls::Object.example

        object_source = SetAttributes::DataSource::Object.build(data, mapping)

        value = object_source.get_value(:some_attribute)

        test "Source value is retrieved by the receiver attribute name" do
          assert(value = data.some_other_attribute)
        end
      end
    end
  end
end
