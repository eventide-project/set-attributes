require_relative '../../test_init'

context 'Attribute Map' do
  context 'Get Missing Attribute' do
    entries = []

    attribute_map = SetAttributes::Map.build(entries)

    source_attribute = SecureRandom.hex.to_sym
    receiver_attribute = attribute_map[source_attribute]

    test "Value is nil" do
      assert(receiver_attribute.nil?)
    end
  end
end
