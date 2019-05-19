require_relative '../../test_init'

context 'Attribute Map' do
  context 'Balance Missing Receiver Attributes' do
    context 'Unary Entries' do
      entries = Controls::AttributeMap::Unbalanced.example

      attribute_map = SetAttributes::Map.build(entries)

      attribute_map.keys.each do |source_attribute|
        receiver_attribute = attribute_map[source_attribute]

        mapping = attribute_map.mapping(source_attribute)
        test "Value is filled with itself (#{mapping})" do
          assert(receiver_attribute == source_attribute)
        end
      end
    end

    context 'Balanced Entry' do
      entries = Controls::AttributeMap::Transform.example

      attribute_map = SetAttributes::Map.build(entries)

      source_attribute = :some_attribute
      receiver_attribute = attribute_map[source_attribute]

      mapping = attribute_map.mapping(source_attribute)
      test "Value is unchanged (#{mapping})" do
        assert(receiver_attribute == :some_other_attribute)
      end
    end
  end
end
