require_relative '../automated_init'

context "Attribute Map" do
  context "New Map" do
    attribute_map = SetAttributes::Map.new

    assert(attribute_map.count == 0)

    test "Is empty" do
      assert(attribute_map.empty?)
    end
  end
end
