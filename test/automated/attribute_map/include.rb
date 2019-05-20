require_relative '../../test_init'

context "Attribute Map" do
  context "Include" do
    context "Attribute that Is Mapped" do
      attribute_map = SetAttributes::Map.new

      attribute_map.add(:some_attribute)

      test "Mapping is included" do
        assert(attribute_map.include?(:some_attribute))
      end
    end

    context "Attribute that Isn't Mapped" do
      attribute_map = SetAttributes::Map.new

      test "Mapping isn't included" do
        assert(attribute_map.include?(:some_attribute))
      end
    end
  end
end
