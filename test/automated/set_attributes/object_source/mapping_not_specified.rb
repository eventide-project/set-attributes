require_relative '../../../test_init'

context "Set Attributes" do
  context "Object Source" do
    context "Mapping Not Specified" do
      test "Is an error" do
        __ = nil
        assert proc { SetAttributes.(__, __) } do
          raises_error? SetAttributes::DataSource::Object::Error
        end
      end
    end
  end
end
