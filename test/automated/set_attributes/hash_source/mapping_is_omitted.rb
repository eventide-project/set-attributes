require_relative '../../../test_init'

context "Set Attributes" do
  context "Object Source" do
    context "Mapping is Omitted" do
      source = SetAttributes::Controls::Hash.example
      reciever = nil

      set_attributes = SetAttributes.build(reciever, source)

      test "Hash's keys are used as the mapping" do
        assert(set_attributes.attribute_map.keys == source.keys)
      end
    end
  end
end
