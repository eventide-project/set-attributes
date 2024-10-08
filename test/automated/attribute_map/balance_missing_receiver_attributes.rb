require_relative '../automated_init'

context "Attribute Map" do
  context "Balance Missing Receiver Attributes" do
    context "Unary Mapping" do
      mapping = Controls::Mapping::Unbalanced.example

      attribute_map = SetAttributes::Map.build(mapping)

      attribute_map.keys.each do |source_attribute|
        receiver_attribute = attribute_map[source_attribute]

        mapping = attribute_map.mapping(source_attribute)
        test "Value is filled with itself (#{mapping})" do
          assert(receiver_attribute == source_attribute)
        end
      end
    end

    context "Balanced Mapping" do
      mapping = Controls::Mapping::Transform.example

      attribute_map = SetAttributes::Map.build(mapping)

      source_attribute = :some_attribute
      receiver_attribute = attribute_map[source_attribute]

      mapping = attribute_map.mapping(source_attribute)
      test "Value is unchanged (#{mapping})" do
        assert(receiver_attribute == :some_other_attribute)
      end
    end
  end
end
