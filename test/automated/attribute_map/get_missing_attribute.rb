require_relative '../automated_init'

context "Attribute Map" do
  context "Get Missing Attribute" do
    entries = []

    attribute_map = SetAttributes::Map.build(entries)

    source_attribute = Controls::Attribute::Random.example
    receiver_attribute = attribute_map[source_attribute]

    test "Value is nil" do
      assert(receiver_attribute.nil?)
    end
  end
end
