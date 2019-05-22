require_relative '../../../test_init'

context "Set Attributes" do
  context "Object Source" do
    context "Mapping is Omitted" do
      source = nil
      reciever = nil

      test "Is an error" do
        assert proc { SetAttributes.build(reciever, source) } do
          raises_error? SetAttributes::DataSource::Object::Error
        end
      end
    end
  end
end
