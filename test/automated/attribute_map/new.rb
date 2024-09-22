require_relative '../automated_init'

context "Attribute Map" do
  context "New Map" do
    attribute_map = SetAttributes::Map.new

    test "Has no mappings" do
      assert(attribute_map.count == 0)
    end
  end
end
