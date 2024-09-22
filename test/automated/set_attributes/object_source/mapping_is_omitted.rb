require_relative '../../automated_init'

context "Set Attributes" do
  context "Object Source" do
    context "Mapping is Omitted" do
      source = nil
      reciever = nil

      test "Is an error" do
        assert_raises(SetAttributes::DataSource::Object::Error) do
          SetAttributes.build(reciever, source)
        end
      end
    end
  end
end
